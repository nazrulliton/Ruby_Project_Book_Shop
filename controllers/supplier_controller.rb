require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/supplier.rb')
also_reload( '../models/*' )

get '/suppliers' do
  @supplier = Supplier.all
  erb ( :"suppliers/index" )
end

get '/suppliers/:id' do
  @supplier = Supplier.find(params['id'].to_i)
  erb(:"suppliers/show")
end
