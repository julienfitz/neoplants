require 'pry'

class PlantsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

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

    if params[:feed]
      feed
    elsif params[:water]
      water
    elsif params[:sun]
      sunlight
    elsif params[:pass_time]
      pass_time
    elsif params[:talk]
      talk
    else
      @plant.update_attributes!(plant_params)
      redirect_to plant_path(@plant)
    end
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
    params.require(:plant).permit(:name, :disposition, :food_status, :water_status, :sunlight_status)
  end

  def handle_invalid_record(exception)
    puts exception
    flash[:error] = exception
    redirect_to plant_path(@plant)
  end

  def talk
    @plant.update_attributes!(mood_status: @plant.mood_status + 1)
    redirect_to plant_path(@plant)
  end

  def feed
    food = @plant.food_status + 1
    @plant.update_attributes!(food_status: food)

    redirect_to plant_path(@plant)
  end

  def water
    water = @plant.water_status + 1
    @plant.update_attributes!(water_status: water)

    redirect_to plant_path(@plant)
  end

  def sunlight
    sun = @plant.sunlight_status + 1
    @plant.update_attributes!(sunlight_status: sun)

    redirect_to plant_path(@plant)
  end

  def pass_time
    new_time = @plant.in_game_time + params[:pass_time].to_i.hours
    @plant.update_attributes!(in_game_time: new_time)
    update_plant_statuses
    update_mood_status

    redirect_to plant_path(@plant)
  end

  def update_plant_statuses
    @plant.update_attributes!(
      food_status: @plant.food_status - 1,
      sunlight_status: @plant.sunlight_status - 1,
      water_status: @plant.water_status - 1)

    # update health separately because we want the other attrs updated first
    @plant.update_attributes!(health_status: health_score)
  end

  def update_mood_status
    # do not change mood at end-of-day for "easygoing"
    if @plant.disposition == "neutral"
      @plant.update_attributes!(mood_status: @plant.mood_status - 1)
    elsif @plant.disposition == "irritable"
      @plant.update_attributes!(mood_status: @plant.mood_status - 2)
    end
  end

  def health_score
    # average out all the stats
    avg = (@plant.food_status + @plant.sunlight_status + @plant.water_status + @plant.mood_status) / 4
    # alter according to disposition
    if @plant.disposition == "easygoing"
      avg + 1
    elsif @plant.disposition == "neutral"
      avg
    elsif @plant.disposition == "irritable"
      avg - 1
    end
  end
end
