require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/supplier.rb')
also_reload( '../models/*' )

get '/suppliers' do
  @supplier = Supplier.all
  erb ( :"suppliers/index" )
end
