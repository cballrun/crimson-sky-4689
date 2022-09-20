require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    describe '#calorie_count' do
      it 'counts the calories in a dish' do
        c2 = Chef.create!(name: "Jim Lahey")
        
        old_tom = Dish.create!(name: "Old Thompson", description: "Jim's Old Tom", chef_id: c2.id)
        taaka = Dish.create!(name: "Taaka", description: "Jim's Taaka", chef_id: c2.id)

        cheese = Ingredient.create!(name: "Cheese", calories: 100)
        liquor = Ingredient.create!(name: "Liquor", calories: 200)
        glass = Ingredient.create!(name: "Glass", calories: 300)
        trailer = Ingredient.create!(name: "Trailer", calories: 400)
        
        old_tom_liquor = DishIngredient.create!(dish_id: old_tom.id, ingredient_id: liquor.id)
        old_tom_glass = DishIngredient.create!(dish_id: old_tom.id, ingredient_id: glass.id) #900 calories
        old_tom_trailer= DishIngredient.create!(dish_id: old_tom.id, ingredient_id: trailer.id)

        taaka_liquor = DishIngredient.create!(dish_id: taaka.id, ingredient_id: liquor.id)
        taaka_glass = DishIngredient.create!(dish_id: taaka.id, ingredient_id: glass.id) #1000 calories
        taaka_cheese = DishIngredient.create!(dish_id: taaka.id, ingredient_id: cheese.id)
        taaka_trailer= DishIngredient.create!(dish_id: taaka.id, ingredient_id: trailer.id)

        expect(old_tom.calorie_count).to eq(900)
        expect(taaka.calorie_count).to eq(1000)
      end
    end
  end
end