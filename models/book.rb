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



end
