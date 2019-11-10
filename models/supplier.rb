class Supplier
attr_accessor :id, :name, :address

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @address = options['address']
end


end
