class SpeciesController < ApplicationController

  def index
    @species = Species.all
  end

  def show
    @species = Species.find(params[:id])
  end

  def new
    @species = Species.new
  end

  def create
    @species = Species.new(species_params)
    if @species.save
      redirect_to species_path(@species)
    else
      render :new
    end
  end

  private
  def species_params
    params.require(:species).permit(:name)
  end

end
