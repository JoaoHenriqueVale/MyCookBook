class HomeController < ApplicationController
  def index
    @recipes = Recipe.last(6)
    @cuisines = Cuisine.all()
    @recipe_types = RecipeType.all()
  end

  def search
    @search = params[:search]
    @recipes = Recipe.where("title LIKE ?", "%#{@search}%")
    render :results_search
  end

  def all_recipes
    @recipes = Recipe.all()
    render :all_recipes
  end
end
