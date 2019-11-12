require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/supplier.rb')
also_reload( '../models/*' )

get '/suppliers' do
  @suppliers = Supplier.all
  erb (:"suppliers/index")
end

get '/suppliers/new' do
  @suppliers = Supplier.all
  erb (:"suppliers/new")
end

get '/suppliers/:id' do
  @supplier = Supplier.find_by_id(params['id'].to_i)
  @books =  @supplier.books()
  erb(:"suppliers/show")
end

post '/suppliers' do
  supplier = Supplier.new(params)
  supplier.save()
  redirect to ('/suppliers')
end

post '/suppliers/:id/delete' do
  Suppliers.delete(params[:id])
  redirect to ('/suppliers')
end
