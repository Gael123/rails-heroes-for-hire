class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(superhero_params)
    if @superhero.save
      redirect_to superheroes_path
    else
      render :new
    end
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :price, :description, :location)
  end
end