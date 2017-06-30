class CuisinesController < ApplicationController
  before_action :set_cuisine, only:[:show,:edit,:update]

  def show
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      redirect_to cuisine_url(@cuisine.id)
    else
      flash[:error] = "Você deve informar o nome da cozinha"
      render :new
    end
  end

  def edit
  end

  def update
    @cuisine.update(cuisine_params)
    if @cuisine.valid?
      redirect_to cuisine_url(@cuisine.id)
    else
      flash[:error] = "Você deve informar o nome da cozinha"
      render :edit
    end
  end

  private

  def cuisine_params
      params.require(:cuisine).permit(:name)
  end
  def set_cuisine
    @cuisine = Cuisine.find(params[:id])
  end

end
