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
    @eater = Eater.new(eater_params)
    if @eater.save
      redirect_to eaters_path
    else
      render :new
    end
  end

  private

  def set_eater
    @eater = Eater.find(params[:id])
  end

  def eater_params
    params.require(:eater).permit(:name)
  end
end
