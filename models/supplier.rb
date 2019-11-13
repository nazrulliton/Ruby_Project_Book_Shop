require('pry-byebug')

require_relative( '../db/sql_runner' )

class Supplier
attr_accessor :id, :name, :address

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @address = options['address']
end

def save()
    sql = "INSERT INTO suppliers (
    name, address)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @address]
    output = SqlRunner.run(sql,values)[0]
    @id = output['id'].to_i
  end

  def update()
    sql = "UPDATE suppliers
    SET
    (
      name,address
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @address, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM suppliers"
    output = SqlRunner.run(sql)
    result = output.map{|supplier| Supplier.new(supplier)}
  end

  def books()
      sql = "SELECT books.* FROM books
            INNER JOIN stock ON stock.book_id = books.id
            WHERE supplier_id = $1"
      value = [@id]
      result = SqlRunner.run(sql,value)
      return result.map{|book| Book.new(book)}
    end

  def self.find_by_id(id)
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [id]
    supplier = SqlRunner.run(sql,values)[0]
    return Supplier.new(supplier)
  end

  def self.delete_all
      sql = "DELETE FROM suppliers"
      SqlRunner.run(sql)
    end

    def delete()
       sql = "DELETE FROM suppliers WHERE id = $1"
       values=[@id]
       result = SqlRunner.run(sql,values)
     end

end
