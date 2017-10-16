require 'sinatra'
require 'sinatra/contrib/all'

require_relative('./models/transaction.rb')
require_relative('./models/account.rb')
require_relative('./models/tag.rb')
require_relative('./models/merchant.rb')

get '/' do
    erb(:index)
end
