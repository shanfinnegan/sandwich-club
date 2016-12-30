class EatersController < ApplicationController

  def index
    @eaters = Eater.all
  end

  def show
    set_eater
  end

  def new
    @eater = Eater.new
  end

  def create
    @eater = Eater.new(eater_params(:name))
    @eater.save
    redirect_to new_sandwich_path
  end

  private

  def set_eater
    @eater = Eater.find(params[:id])
  end

  def eater_params(*args)
    params.require(:eater).permit(*args)
  end
end
