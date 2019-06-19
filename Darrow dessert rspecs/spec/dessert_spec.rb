require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Darrow") }
  let(:swedish_fish) { Dessert.new("swedish_fish", 20, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(swedish_fish.type).to eq("swedish_fish")
    end

    it "sets a quantity" do
      expect(swedish_fish.quantity).to eq(20)
    end

    it "starts ingredients as an empty array" do
      expect(swedish_fish.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect{ Dessert.new("gummies", "lots", chef) }.to raise_error(ArgumentError)
    end

    
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      swedish_fish.add_ingredient("red goo")
      expect(swedish_fish.ingredients).to include("red goo")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      ingredients = ['red goo', 'more red goo', 'even MORE red goo', 'you get the point']

      ingredients.each do |ingredient|
        swedish_fish.add_ingredient(ingredient)
      end

      expect(swedish_fish.ingredients).to eq(ingredients)
      swedish_fish.mix!
      expect(swedish_fish.ingredients).not_to eq(ingredients)
      expect(swedish_fish.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      swedish_fish.eat(10)
      expect(swedish_fish.quantity).to eq(10)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { swedish_fish.eat(30) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Fred the Goo Master")
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(swedish_fish)
      swedish_fish.make_more
    end
  end
  end
end
