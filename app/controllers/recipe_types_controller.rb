class RecipeTypesController < ApplicationController
  before_action :set_recipe_type, only:[:show,:edit,:update]

  def show
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(recipe_type_params)
    if @recipe_type.save
      redirect_to recipe_type_url(@recipe_type.id)
    else
      flash[:error] = "Você deve informar o nome do tipo de receita"
      render :new
    end
  end

  def edit
  end

  def update
    @recipe_type.update(recipe_type_params)
    if @recipe_type.valid?
      redirect_to recipe_type_url(@recipe_type.id)
    else
      flash[:error] = "Você deve informar o nome do tipo de receita"
      render :edit
    end
  end

  private

  def recipe_type_params
      params.require(:recipe_type).permit(:name)
  end
  def set_recipe_type
    @recipe_type = RecipeType.find(params[:id])
  end

end
