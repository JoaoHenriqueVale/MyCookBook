class HomeController < ApplicationController
  def index
    @recipes = Recipe.all()
    @cuisines = Cuisine.all()
    @recipe_types = RecipeType.all()
  end

  def search
    @search = params[:search]
    @recipes = Recipe.where("title LIKE ?", "%#{@search}%")
    render :results_search
  end
end
