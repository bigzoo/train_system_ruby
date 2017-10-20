require('pry')
class Train
  attr_reader(:id, :reg_no, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @reg_no = attributes.fetch(:reg_no)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    result = DB.exec('SELECT * FROM trains;')
    trains = []
    result.each do |train|
      id = train.fetch('id').to_i
      reg_no = train.fetch('reg_no')
      name = train.fetch('name')
      train = Train.new(id: id, reg_no: reg_no, name: name)
      trains.push(train)
    end
    trains
  end

  define_method(:save) do
    new_train = DB.exec("INSERT INTO trains (reg_no, name) VALUES ('#{reg_no}', '#{name}') RETURNING id;")
    @id = new_train.first.fetch('id').to_i
  end

  define_method(:==) do |other_train|
    id.==(other_train.id).&name.==(other_train.name)
  end

  define_singleton_method(:delete) do |id|
    DB.exec("DELETE FROM trains WHERE id= #{id}")
  end

  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM trains WHERE id=#{id}").first
    id = result.fetch('id').to_i
    reg_no = result.fetch('reg_no')
    name = result.fetch('name')
    train = Train.new(id: id, reg_no: reg_no, name: name)
    train
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id=#{id}")
  end
end
