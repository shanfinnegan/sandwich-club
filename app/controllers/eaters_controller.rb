class EatersController < ApplicationController

  def index
    @eaters = Eater.all
  end

  def show
    set_eater

  end

  private

  def set_eater
    @eater = Eater.find(params[:id])
  end
end
