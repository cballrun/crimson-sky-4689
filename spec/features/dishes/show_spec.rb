require 'rails_helper'

RSpec.describe 'the dish show page' do
  before :each do
    @c1 = Chef.create!(name: "Randy Bobandy")
    @c2 = Chef.create!(name: "Jim Lahey")
    @c3 = Chef.create!(name: "Ricky LaFleur")

    @d1 = Dish.create!(name: "Cheeseburger", description: "Randy's Cheeseburger", chef_id: @c1.id)
    @d2 = Dish.create!(name: "Pizza", description: "Randy's Pizza", chef_id: @c1.id)

    @d3 = Dish.create!(name: "Old Thompson", description: "Jim's Old Tom", chef_id: @c2.id)
    @d4 = Dish.create!(name: "Taaka", description: "Jim's Taaka", chef_id: @c2.id)

    @d5 = Dish.create!(name: "Goldy", description: "Ricky's Goldfish", chef_id: @c3.id)
    @d6 = Dish.create!(name: "Hockey Stick", description: "Ricky's Hockey Stick", chef_id: @c3.id)

    @i1 = Ingredient.create!(name: "Cheese", calories: 100)
    @i2 = Ingredient.create!(name: "Liquor", calories: 200)
    @i3 = Ingredient.create!(name: "Glass", calories: 300)
    @i4 = Ingredient.create!(name: "Trailer", calories: 400)
  end

  it 'exists' do
    visit "/dishes/#{@d1.id}"
  end


end