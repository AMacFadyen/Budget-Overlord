require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/transaction.rb')
require_relative('../models/account.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')

get '/transactions' do
    @transactions = Transaction.all()
    erb ( :"transactions/index")
end
