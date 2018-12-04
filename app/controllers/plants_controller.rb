require 'pry'

class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.create(plant_params)

    redirect_to plant_path(@plant)
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update_attributes(plant_params)
    
    redirect_to plant_path(@plant)
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy!

    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :disposition)
  end
end
