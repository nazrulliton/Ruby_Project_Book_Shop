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

get '/stock/:id' do
  @stock = Stock.find_by_id(params['id'].to_i)
  erb(:"stock/show")
end

post '/stock' do
  stock = Stock.new(params)
  stock.save
  redirect to("/stock")
end

post '/stock/:id/delete' do
  Stock.delete(params[:id])
  redirect to ('/stock')
end
