class City
  attr_reader(:id,:name)
  define_method(:initialize)do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end
  define_method(:save)do
    result = DB.exec("INSERT INTO cities (name) VALUES ('#{name}') RETURNING id;")
    id = result.first().fetch('id').to_i
    @id = id
  end
  define_singleton_method(:all)do
    cities = []
    result = DB.exec("SELECT * FROM cities;")
    result.each()do |city|
      id = city.fetch('id')
      name = city.fetch('name')
      new_city = City.new(:id,:name)
      cities.push(new_city)
    end
    cities
  end
  define_singleton_method(:delete)do |id|
    DB.exec("DELETE FROM cities WHERE id=#{id};")
  end
end
