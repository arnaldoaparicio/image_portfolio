class AnimalPicturesController < ApplicationController
  include ActiveStorage::SetCurrent
  def index
    @animal_pictures = Picture.all_animals
  end

  def show
    @animal_picture = Picture.find(params[:id])
  end
end