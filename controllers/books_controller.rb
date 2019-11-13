require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/book.rb')
also_reload( '../models/*' )

get '/books' do
   @books = Book.all
  erb (:"books/index")
end

get '/books/new' do
   @books = Book.all
  erb (:"books/new")
end

get '/books/:id' do
  @book = Book.find_by_id(params['id'].to_i)
  @supplier = @book.supplier()
  erb(:"books/show")
end

get '/books/:id/edit' do
  @book = Book.find_by_id(params['id'])
  @suppliers = Supplier.all
  @stock = Stock.all
  erb(:"books/edit")
end

post '/books/:id' do
  book = Book.new(params)
  book.update
  redirect to "/books/#{params['id']}"
end

post '/books' do
  book = Book.new(params)
  book.save()
  redirect to ('/books')
end

post '/books/:id/delete' do
  Book.delete(params[:id])
  redirect to ('/books')
end
