require('pry-byebug')

require_relative( '../db/sql_runner' )

class Book

attr_accessor :id, :name, :description, :genre

def initialize (options)
  @id = options['id'].to_i if options ['id']
  @name = options['name']
  @description = options['description']
  @genre = options['genre']

end


def save()
    sql = "INSERT INTO books (
    name, description, genre)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@name, @description, @genre]
    output = SqlRunner.run(sql,values)[0]
    @id = output['id'].to_i
  end

  def update()
      sql = "UPDATE books
      SET
      (
        name,
        description,
        genre
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@name, @description, @genre, @id]
      SqlRunner.run(sql, values)
    end


  def supplier()
      sql = "SELECT suppliers.* FROM suppliers
      INNER JOIN stock
      ON stock.supplier_id = suppliers.id
      WHERE book_id = $1"
      value = [@id]
      result = SqlRunner.run(sql,value).first()
      return Supplier.new(result)
  end


  def self.all
    sql = "SELECT * FROM books"
    output = SqlRunner.run(sql)
    result = output.map{|book| Book.new(book)}
  end



  def self.find_by_id(id)
    sql = "SELECT * FROM books WHERE id = $1"
    values = [id]
    book = SqlRunner.run(sql,values)[0]
    return Book.new(book)
  end

  def self.delete_all
      sql = "DELETE FROM books"
      SqlRunner.run(sql)
    end

    def delete()
       sql = "DELETE FROM books WHERE id = $1"
       values=[@id]
       result = SqlRunner.run(sql,values)
     end

end
