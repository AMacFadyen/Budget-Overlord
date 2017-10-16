require_relative('../db/sql_runner.rb')
require_relative('./account.rb')
require_relative('./merchant.rb')
require_relative('./tag.rb')

class Transaction

    attr_accessor :spent, :item
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @spent = options['spent']
        @merchant = options['merchant']
        @item = options['item']
        @tag = options['tag']
    end



end
