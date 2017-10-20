require('spec_helper')

describe(City)do
  describe('#initialize')do
    it("initializes new instances of the class") do
      new_city = City.new(id:nil,name:"San Francisco")
      expect(new_city).to(be_an_instance_of(City))
    end
  end

  describe("#id")do
    it("It allows ids to be selected from the instances") do
      new_city = City.new(id:nil,name:"San Francisco")
      new_city.save
      expect(new_city.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#name")do
    it("It allows names to be selected from the instances") do
      new_city = City.new(id:nil,name:"San Francisco")
      expect(new_city.name()).to(eq("San Francisco"))
    end
  end

  describe(".all")do
    it("It is initially empty as first") do
      expect(City.all()).to(eq([]))
    end
  end
end
