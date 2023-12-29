class PicturesController < ApplicationController
  def index
  end

  def new
  end

  def create
    binding.pry
  end

  private
  def pictures_params
    params.permit(:title, :description, :type_of_picture, :device, :location, :year)
  end
end