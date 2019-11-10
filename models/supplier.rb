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




end
