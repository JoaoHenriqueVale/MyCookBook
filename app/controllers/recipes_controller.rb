class RecipesController < ApplicationController
  before_action :set_collections, only:[:new]
  before_action :set_recipe, only:[:show]

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_url(@recipe.id)
    else
      flash[:error] = "Você deve informar todos os dados da receita"
      set_collections
      render :new
    end
  end

  private

  def recipe_params
      params.require(:recipe).permit(:title, :recipe_type_id,
                                     :cook_time, :cuisine_id, :ingredients,
                                     :method, :difficulty)
  end

  def set_collections
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
