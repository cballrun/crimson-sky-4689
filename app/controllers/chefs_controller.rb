class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
    # @ingredients = @dish.ingredients
    # @chef = @dish.chef
  end

end