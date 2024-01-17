class AnimalPicturesController < ApplicationController
  def index
    @animal_pictures = Picture.all_animals
  end
end