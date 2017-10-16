require_relative('../db/sql_runner.rb')

class Merchant

    attr_accessor :name
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
    end

    def save()
        sql = "INSERT INTO merchants (name) VALUES ($1) RETURNING id;"
        values = [@name]
        merchant = SqlRunner.run(sql, "save_merchant", values)
        @id = merchant[0]['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM merchants;"
        values = []
        SqlRunner.run(sql, "delete_all_merchants", values)
    end

end
