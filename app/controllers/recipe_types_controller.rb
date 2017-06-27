class RecipeTypesController < ApplicationController
  before_action :set_recipe_type, only:[:show]

  def show
  end

  private
  def set_recipe_type
    @recipe_type = RecipeType.find(params[:id])
  end

end
