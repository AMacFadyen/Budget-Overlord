require_relative('../db/sql_runner.rb')

class Tag

    attr_accessor :name
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
    end

    def save()
        sql = "INSERT INTO tags (name) VALUES ($1) RETURNING id;"
        values = [@name]
        tag = SqlRunner.run(sql, "save_tag", values)
        @id = tag[0]['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM tags;"
        values = []
        SqlRunner.run(sql, "delete_all_tags", values)
    end

    def self.all()
        sql = "SELECT * FROM tags"
        values = []
        tags = SqlRunner.run(sql, "all_tags", values)
        return tags.map{|tag|Tag.new(tag)}
    end

    

end
