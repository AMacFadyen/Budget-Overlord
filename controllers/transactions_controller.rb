require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/transaction.rb')
require_relative('../models/account.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')

get '/transactions' do
    @transactions = Transaction.all()
    @merchants = Merchant.all()
    @tags = Tag.all()
    erb ( :"transactions/index" )
end

get '/transactions/tag' do
    @transactions = Transaction.all()
    @tags = Tag.all()
    erb ( :"transactions/tag" )
end

get '/transactions/new' do
    @transactions = Transaction.all()
    @tags = Tag.all()
    @merchants = Merchant.all()
    erb ( :"transactions/new" )
end

post '/transactions' do
    @transaction = Transaction.new(params)
    @transaction.save()
    erb (:"transactions/created")
end
