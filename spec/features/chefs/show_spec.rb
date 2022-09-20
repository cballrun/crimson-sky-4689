require 'rails_helper'

RSpec.describe 'the chef show page' do
  before :each do
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

    @stick_glass = DishIngredient.create!(dish_id: @stick.id, ingredient_id: @glass.id)
    @stick_trailer = DishIngredient.create!(dish_id: @stick.id, ingredient_id: @trailer.id)
  end

  it 'exists' do
    visit chef_path(@c3)
  end

  it 'shows the chefs name' do
    visit chef_path(@c3)

    expect(page).to have_content("Chef Name: Ricky LaFleur")
  end

  it 'links to the chef ingredients index' do
    visit chef_path(@c3)
    click_link("View Chef Ingredients")
    expect(current_path).to eq(chef_ingredients_path(@c3))
  end


end