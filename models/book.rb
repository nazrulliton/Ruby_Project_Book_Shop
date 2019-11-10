class Book

attr_accessor :id, :name, :description, :genre

def initialize (options)
  @id = options['id'].to_i if options ['id']
  @name = options['name']
  @description = options['description']
  @genre = options['genre']

end



end
