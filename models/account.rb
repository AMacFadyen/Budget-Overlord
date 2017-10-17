require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')

class Account

    attr_accessor :name, :budget, :total_spent
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @budget = options['budget']
    end

    def save()
        sql = "INSERT INTO accounts (name, budget) VALUES ($1, $2) RETURNING id;"
        values = [@name, @budget]
        account = SqlRunner.run(sql, "save_account", values)
        @id = account[0]['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM accounts;"
        values = []
        SqlRunner.run(sql, "delete_all_accounts", values)
    end

end
