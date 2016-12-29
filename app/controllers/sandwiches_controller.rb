class SandwichesController < ApplicationController

  def index
    @sandwiches = Sandwich.all
  end

  def show
    set_sandwich

  end

  private

  def set_sandwich
    @sandwich = Sandwich.find(params[:id])
  end

end
