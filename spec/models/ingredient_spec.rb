require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  describe "relationships" do
    it {should have_many(:dishes)}
    xit { should have_many(:chefs).through(:chef_ingredients)}
  end

end