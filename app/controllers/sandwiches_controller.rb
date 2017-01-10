class SandwichesController < ApplicationController

  def index
    @sandwiches = Sandwich.all
  end

  def show
    set_sandwich
    @eaters = Eater.all
    @comments = Comment.all
    @comment = Comment.new
  end

  def new
    @eaters = Eater.all.order(:name)
    @sandwich = Sandwich.new
  end

  def create
    @sandwich = Sandwich.new(sandwich_params)
    if !params[:sandwich][:eater][:name].empty?
      @eater = Eater.find_or_create_by(name: capitalize_name(params[:sandwich][:eater][:name]))
      @sandwich.eaters << @eater
    end
    if @sandwich.save
      redirect_to sandwich_path(@sandwich)
    else
      @eaters = Eater.all.order(:name)
      render :new
    end
  end

  def update
    set_sandwich
    if @sandwich.update(sandwich_params)
      @comment = Comment.new(text: params[:sandwich][:comment][:text], sandwich_id: @sandwich.id)
      @eater = Eater.find_or_create_by(name: capitalize_name(params[:sandwich][:comment][:eater][:name]))
      @comment.eater = @eater
      @comment.save
      @sandwich.comments << @comment
      redirect_to sandwich_path(@sandwich)
    else
      @eaters = Eater.all.order(:name)
      render :show
    end
  end

  private
  def set_sandwich
    @sandwich = Sandwich.find(params[:id])
  end

  def capitalize_name(name)
    name.split.map(&:capitalize)*' '
  end

  def sandwich_params
    params.require(:sandwich).permit(:ingredients, :date, :location, :price, :tasting_notes, eater_ids: [], eater_attributes: [:id, :name], comment_attributes: [:text, :sandwich_id, :eater_id])
  end

end
