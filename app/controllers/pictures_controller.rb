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
    params.permit(:title, :description, :type, :device, :location, :year)
  end
end