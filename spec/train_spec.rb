require('spec_helper')

describe(Train)do

  describe('#initialize')do
    it("It creates new instances of the Train class") do
      new_train = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      expect(new_train).to(be_an_instance_of(Train))
    end
  end

  describe('#id')do
    it("It lets us get the id from an instance") do
      new_train = Train.new(id:1,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      expect(new_train.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#reg_no')do
    it("It lets us get the reg_no from an instance") do
      new_train = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      expect(new_train.reg_no).to(eq("ASF23RA3S23ED"))
    end
  end

  describe('#name')do
    it("It lets us get the name from an instance") do
      new_train = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      expect(new_train.name).to(eq("Pelham 123"))
    end
  end

  describe('#save')do
    it("It lets you save a new train to the database") do
      new_train = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      new_train.save
      expect(Train.all).to(eq([new_train]))
    end
  end

  describe('#==')do
    it("It identifies trains with either the same id or name as equal") do
      new_train = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      new_train2 = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      expect(new_train).to(eq(new_train2))
    end
  end

  describe('.all')do
    it("It fetches all trains in the database") do
      new_train = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      new_train.save
      new_train2 = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      new_train2.save
      expect(Train.all).to(eq([new_train,new_train2]))
    end
  end

  describe('.find')do
    it("It fetches a train in the database when given the id") do
      new_train = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      new_train.save
      expect(Train.find(new_train.id())).to(eq(new_train))
    end
  end

  describe('.delete')do
    it("It deletes a train in the database when given the id") do
      new_train = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      new_train.save
      Train.delete(new_train.id)
      expect(Train.all).to(eq([]))
    end
  end

  describe('#update')do
    it("It updates a train in the database when given the id") do
      new_train = Train.new(id:nil,name:'Pelham 123', reg_no:'ASF23RA3S23ED')
      new_train.save
      new_train.update(name:"123 Pelham")
      expect(Train.find(new_train.id()).name).to(eq("123 Pelham"))
    end
  end

end
