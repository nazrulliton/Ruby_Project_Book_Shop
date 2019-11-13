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

post '/suppliers' do
  supplier = Supplier.new(params)
  supplier.save()
  redirect to ('/suppliers')
end

get '/suppliers/:id' do
  @supplier = Supplier.find_by_id(params['id'].to_i)
  @books =  @supplier.books()
  erb(:"suppliers/show")
end

get '/suppliers/:id/edit' do
  @supplier = Supplier.find_by_id(params['id'])
  @books = Book.all
  @stock = Stock.all
  erb(:"suppliers/edit")
end

post '/suppliers/:id' do
  supplier = Supplier.new(params)
  supplier.update
  redirect to "/supplier/#{params['id']}"
end


post '/suppliers/:id/delete' do
  supplier = Supplier.find_by_id(params['id'])
  supplier.delete
  redirect to "/suppliers"
end
