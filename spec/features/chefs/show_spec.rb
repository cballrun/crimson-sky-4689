require 'rails_helper'

RSpec.describe 'the chef show page' do
  before :each do
    @c1 = Chef.create!(name: "Randy Bobandy")
    @c2 = Chef.create!(name: "Jim Lahey")
    @c3 = Chef.create!(name: "Ricky LaFleur")
  end

  it 'exists' do
    visit chef_path(@c3)
  end

  it 'shows the chefs name' do
    visit chef_path(@c3)

    expect(page).to have_content("Chef Name: Ricky LaFleur")
  end


end