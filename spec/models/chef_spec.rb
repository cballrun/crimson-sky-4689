require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:chef_ingredients)}
  end

  xit 'can tell which ingredients are in its dishes' do
    @c1 = Chef.create!(name: "Randy Bobandy")
    @c2 = Chef.create!(name: "Jim Lahey")
    @c3 = Chef.create!(name: "Ricky LaFleur")

    @goldy = Dish.create!(name: "Goldy", description: "Ricky's Goldfish", chef_id: @c3.id)
    @stick = Dish.create!(name: "Hockey Stick", description: "Ricky's Hockey Stick", chef_id: @c3.id)

    @goldfish = Ingredient.create!(name: "Goldfish", calories: 100)
    @liquor = Ingredient.create!(name: "Liquor", calories: 200)
    @glass = Ingredient.create!(name: "Glass", calories: 300)
    @trailer = Ingredient.create!(name: "Trailer", calories: 400)
    
    @goldy_goldfish = DishIngredient.create!(dish_id: @goldy.id, ingredient_id: @goldfish.id)
    @goldy_liquor = DishIngredient.create!(dish_id: @goldy.id, ingredient_id: @liquor.id)

    # @stick_glass = DishIngredient.create!(dish_id: @stick.id, ingredient_id: @glass.id)
    @stick_trailer = DishIngredient.create!(dish_id: @stick.id, ingredient_id: @trailer.id)
  
    expect(@c3.ingredients).to eq([@goldfish, @liquor, @trailer])
  end


end