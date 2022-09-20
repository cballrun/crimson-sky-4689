require 'rails_helper'

RSpec.describe 'the dish show page' do
  before :each do
    @c1 = Chef.create!(name: "Randy Bobandy")
    @c2 = Chef.create!(name: "Jim Lahey")
    @c3 = Chef.create!(name: "Ricky LaFleur")

    @cheeseburger = Dish.create!(name: "Cheeseburger", description: "Randy's Cheeseburger", chef_id: @c1.id)
    @pizza = Dish.create!(name: "Pizza", description: "Randy's Pizza", chef_id: @c1.id)

    @old_tom = Dish.create!(name: "Old Thompson", description: "Jim's Old Tom", chef_id: @c2.id)
    @taaka = Dish.create!(name: "Taaka", description: "Jim's Taaka", chef_id: @c2.id)

    @goldy = Dish.create!(name: "Goldy", description: "Ricky's Goldfish", chef_id: @c3.id)
    @stick = Dish.create!(name: "Hockey Stick", description: "Ricky's Hockey Stick", chef_id: @c3.id)

    @cheese = Ingredient.create!(name: "Cheese", calories: 100)
    @liquor = Ingredient.create!(name: "Liquor", calories: 200)
    @glass = Ingredient.create!(name: "Glass", calories: 300)
    @trailer = Ingredient.create!(name: "Trailer", calories: 400)

    @burger_cheese = DishIngredient.create!(dish_id: @cheeseburger.id, ingredient_id: @cheese.id)
    @burger_liquor = DishIngredient.create!(dish_id: @cheeseburger.id, ingredient_id: @liquor.id)
  end

  it 'exists' do
    visit "/dishes/#{@cheeseburger.id}"
  end

  it 'shows the dishes name and description' do
    visit "/dishes/#{@cheeseburger.id}"
    
    expect(page).to have_content("Dish Name: Cheeseburger")
    expect(page).to have_content("Dish Description: Randy's Cheeseburger")
  end

  it 'shows the dishes ingredients' do
    visit "/dishes/#{@cheeseburger.id}"
    within("#ingredients") do
      expect(page).to have_content("Cheese")
      expect(page).to have_content("Liquor")
    end
  end

  it 'shows the dishes chef name' do
    visit "/dishes/#{@cheeseburger.id}"
    within("#chef") do
      expect(page).to have_content("Chef: Randy Bobandy")
    end
  end


end