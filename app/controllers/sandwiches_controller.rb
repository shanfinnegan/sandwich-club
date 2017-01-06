class SandwichesController < ApplicationController

  def index
    if params[:ingredients]
      @sandwiches = Sandwich.where("ingredients LIKE ?", "%#{params[:ingredient]}%")
    else
      @sandwiches = Sandwich.all
    end
  end

  def show
    set_sandwich
    @comment = Comment.new
  end

  def new
    @eaters = Eater.all.order(:name)
    @sandwich = Sandwich.new
  end

  def create
    binding.pry
    @sandwich = Sandwich.new(sandwich_params)
    if !params[:sandwich][:eater][:name].empty?
      @eater = Eater.find_or_create_by(name: params[:sandwich][:eater][:name])
      @sandwich.eaters << @eater
    end
    if @sandwich.valid?
      @sandwich.save
      redirect_to sandwich_path(@sandwich)
    else
      render :new
    end
  end

  def update
    set_sandwich
  end

  private

  def set_sandwich
    @sandwich = Sandwich.find(params[:id])
  end

  def sandwich_params
    params.require(:sandwich).permit(:ingredients, :date, :location, :price, :tasting_notes, eater_ids: [], eater_attributes: [:id, :name])
  end
# , eater_ids: [], eater_attributes: [:id, :name]
end
