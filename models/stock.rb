require('pry-byebug')

require_relative( '../db/sql_runner' )

class Stock
attr_accessor :id, :book_name, :quantity, :buying_cost, :selling_price, :book_id, :supplier_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @book_name = options['book_name']
  @quantity = options['quantity']
  @buying_cost = options['buying_cost']
  @selling_price = options['selling_price']
  @book_id = options['book_id']
  @supplier_id = options['supplier_id']
end

def save()
    sql = "INSERT INTO stock (
    book_name, quantity, buying_cost, selling_price, book_id, supplier_id)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@book_name, @quantity, @buying_cost, @selling_price, @book_id, @supplier_id]
    output = SqlRunner.run(sql,values)[0]
    @id = output['id'].to_i
  end

  def update()
      sql = "UPDATE books
      SET
      (
        book_name, quantity, buying_cost, selling_price, book_id, supplier_id
      ) =
      (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7"
      values = [@book_name, @quantity, @buying_cost, @selling_price, @book_id, @supplier_id @id]
      SqlRunner.run(sql, values)
    end

  def self.all
    sql = "SELECT * FROM stock"
    output = SqlRunner.run(sql)
    result = output.map{|stock| Stock.new(stock)}
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

  def delete()
     sql = "DELETE FROM stock WHERE id = $1"
     values=[@id]
     result = SqlRunner.run(sql,values)
   end


end
