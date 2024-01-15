class PicturesController < ApplicationController
  include ActiveStorage::SetCurrent
  def index
    @animal_pictures = Picture.all_animals
    @landscape_pictures = Picture.all_landscapes
  end

  def new
  end

  def create
    Picture.create(picture_params)
    redirect_to '/pictures'
  end

  private
  def picture_params
    params.permit(:title, :description, :type_of_picture, :device, :location, :year, :personal_pic)
  end
end