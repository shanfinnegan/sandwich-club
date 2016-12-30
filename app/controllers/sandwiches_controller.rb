class SandwichesController < ApplicationController

  def index
    @sandwiches = Sandwich.all
  end

  def show
    set_sandwich
  end

  def new
    @eaters = Eater.all
    @sandwich = Sandwich.new
  end

  def create
    @sandwich = Sandwich.new(sandwich_params(:ingredients, :date, :location, :price, :tasting_notes, eater_ids: []))
    @sandwich.save
    redirect_to sandwich_path(@sandwich)
  end

  def update
    set_sandwich
  end

  private

  def set_sandwich
    @sandwich = Sandwich.find(params[:id])
  end
  def sandwich_params(*args)
    params.require(:sandwich).permit(*args)
  end

end
