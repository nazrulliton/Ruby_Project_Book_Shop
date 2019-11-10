class Stock
attr_accessor :id, :quantity, :buying_cost, :selling_price, :book_id, :supplier_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @quantity = options['quantity']
  @buying_cost = options['buying_cost']
  @selling_price = options['selling_price']
  @book_id = options['book_id']
  @supplier_id = options['supplier_id']
end




end
