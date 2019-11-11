require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/book.rb')
also_reload( '../models/*' )

get '/books' do
   @books = Book.all
  erb (:"books/index")
end

# get '/books/:id' do
#   @books = Book.find(params['id'].to_i)
#   erb(:"books/show")
# end
