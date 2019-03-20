require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do

  # subject(:dessert) do
  #   chef = Chef.new(
  #     :name => "Chef John",
  #   )
  #   dessert.new("cookie",5,chef)
  # end


  describe "#initialize" do
    let(:chef) { double("chef") }
    subject(:dessert) { Dessert.new("cookie", 5, chef) }


    it "sets a type" do 
      expect(dessert.type).to eq("cookie")
    end
     
    it "sets a quantity" do
      expect(dessert.quantity).to be_a(Integer)
    end
    
    it "starts ingredients as an empty array" do 
      expect(dessert.ingredients).to eq(Array.new)
    end
    
    it "raises an argument error when given a non-integer quantity" do
      expect do 
        Dessert.new("cookie","five",chef)
      end.to raise_error(ArgumentError)
    end
    
  end

  describe "#add_ingredient" do
    let(:chef) { double("chef") }
    subject(:dessert) { Dessert.new("cookie", 5, chef) }

    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("butter")
      expect(dessert.ingredients).to eq(["butter"])
    end
  end

  describe "#mix!" do
    let(:chef) { double("chef") }
    subject(:dessert) { Dessert.new("cookie", 5, chef) }
    #let(:a) {dessert.mix!}
    it "shuffles the ingredient array" do
      dessert.add_ingredient("butter")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("vanilla")
      dessert.add_ingredient("baking powder")
      dessert.add_ingredient("flour")      
      expect(dessert.mix!).to eq(dessert.ingredients)
    end
  end

  describe "#eat" do
    let(:chef) { double("chef") }
    subject(:dessert) { Dessert.new("cookie", 5, chef) }
    it "subtracts an amount from the quantity" do
      dessert.eat(2)
      expect(dessert.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect do 
        dessert.eat(6)
      end.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    let(:chef) { Chef.new("John") }
    subject(:dessert) { Dessert.new("cookie", 5, chef) }
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include(chef.titleize)
    end
  end

  describe "#make_more" do
    subject(:chef) { Chef.new("John") }
    let(:dessert) { Dessert.new("cookie", 5, chef) }
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(subject).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
