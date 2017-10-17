require_relative('../db/sql_runner.rb')
require_relative('./account.rb')
require_relative('./merchant.rb')
require_relative('./tag.rb')

class Transaction

    attr_accessor :cost, :item, :date, :total_costs
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        # @account = options['account']
        @cost = options['cost']
        @merchant = options['merchant']
        @item = options['item']
        @tag = options['tag']
        @date = options['date']

    end

    def save()
        sql = "INSERT INTO transactions(cost, merchant, item, tag, date) VALUES ($1, $2, $3, $4, $5) RETURNING id;"
        values = [@cost, @merchant, @item, @tag, @date]
        transaction = SqlRunner.run(sql, "save_transaction", values)
        @id = transaction[0]['id'].to_i
    end

    def delete()
        sql = "DELETE * FROM transactions WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, "delete_transaction", values)
    end

    def merchant()
        sql = "SELECT * FROM merchants WHERE id = $1;"
        values = [@merchant]
        merchants = SqlRunner.run(sql, "find_merchant", values)
        return Merchant.new(merchants.first())
    end

    def tag()
        sql = "SELECT * FROM tags WHERE id = $1;"
        values = [@tag]
        tags = SqlRunner.run(sql, "find_tag", values)
        return Tag.new(tags.first())
    end

    def self.delete_all()
        sql = 'DELETE FROM transactions;'
        values = []
        SqlRunner.run(sql, "delete_all_transactions", values)
    end

    def self.all()
        sql = "SELECT * FROM transactions;"
        values = []
        transactions = SqlRunner.run(sql, "all_transactions", values)
        return transactions.map{|transaction|Transaction.new(transaction)}
    end

    def self.find(id)
        sql = "SELECT * FROM transactions WHERE id = $1;"
        values = [id]
        transaction = SqlRunner.run(sql, "find_single_transaction",values).first()
        return Transaction.new(transaction)
    end

    def self.by_tag(tag)
        sql = "SELECT * FROM transactions WHERE tag = $1"
        values= [tag]
        transactions = SqlRunner.run(sql, "return_all_specific_tags", values)
        return transactions.map{|transaction|Transaction.new(transaction)}
    end

    def self.total_spent()
        sql = "SELECT SUM(cost) FROM transactions;"
        values = []
        @total_costs =+ SqlRunner.run(sql, "total_costs", values)[0].values().first().to_i
        return @total_costs
    end

    def budget_check()
        if @total_costs + @cost > @account.budget()
            return "That exceeds your budget! Purchase denied!"
        end
    end
end
