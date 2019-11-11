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
