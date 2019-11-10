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

  def self.all
    sql = "SELECT * FROM suppliers"
    output = SqlRunner.run(sql)
    artists = output.map{|supplier| Supplier.new(supplier)}
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

    def self.delete(id)
       sql = "DELETE FROM suppliers WHERE id = $1"
       values=[id]
       result = SqlRunner.run(sql,values)
     end

end
