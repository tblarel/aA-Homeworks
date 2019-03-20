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
    let(:a) {dessert.ingredients}
    let (:dup) {dessert.dup.mix!}
    it "shuffles the ingredient array" do
      dessert.add_ingredient("butter")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("vanilla")
      dessert.add_ingredient("baking powder")
      dessert.add_ingredient("flour")
      expect(a).not_to eq(dup)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
    end

    it "raises an error if the amount is greater than the quantity" do
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
    end
  end
end
