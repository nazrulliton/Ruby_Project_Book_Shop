require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/supplier.rb')
require_relative('../models/stock.rb')
require_relative('../models/book.rb')

also_reload( '../models/*' )

get '/stock' do
  @stock = Stock.all
  erb ( :"stock/index" )
end

get '/stock/new' do
  @stock = Stock.all
  @books = Book.all
  @suppliers = Supplier.all
  erb ( :"stock/new" )
end

post '/stock' do
  stock = Stock.new(params)
  stock.save
  redirect to("/stock")
end

get '/stock/:id' do
  @stock = Stock.find_by_id(params['id'].to_i)
  erb(:"stock/show")
end

get '/stock/:id/edit' do
  @suppliers = Supplier.all
  @books = Book.all
  @stock = Stock.find_by_id(params['id'])
  erb (:'stock/edit')
end



post '/stock/:id/delete' do
  stock = Stock.find_by_id(params['id'])
  stock.delete
  redirect to "/stock"
end
