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


def save()
    sql = "INSERT INTO stock (
    quantity, buying_cost, selling_price, book_id, supplier_id)
    VALUES ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@quantity, @buying_cost, @selling_price, @book_id, @supplier_id]
    output = SqlRunner.run(sql,values)[0]
    @id = output['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM stock"
    output = SqlRunner.run(sql)
    artists = output.map{|stock| Stock.new(artist)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM stock WHERE id = $1"
    values = [id]
    stock = SqlRunner.run(sql,values)[0]
    return Stock.new(stock)
  end

  def self.delete_all
    sql = "DELETE FROM stock"
    SqlRunner.run(sql)
  end

  def self.delete(id)
     sql = "DELETE FROM stock WHERE id = $1"
     values=[id]
     result = SqlRunner.run(sql,values)
   end





end
