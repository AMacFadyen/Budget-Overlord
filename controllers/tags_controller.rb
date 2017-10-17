require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/tag.rb')

get '/tags' do
    @tags = Tag.all()
    erb ( :'/tags/index')
end
