require_relative('../db/sql_runner.rb')
require_relative('./account.rb')
require_relative('./merchant.rb')
require_relative('./tag.rb')

class Transaction

    attr_accessor :cost, :merchant, :item, :tag, :date
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
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

    def self.delete_all()
        sql = 'DELETE FROM transactions;'
        values = []
        SqlRunner.run(sql, "delete_all_transactions", values)
    end


end
