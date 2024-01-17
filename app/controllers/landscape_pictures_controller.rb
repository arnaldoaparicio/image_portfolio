class LandscapePicturesController < ApplicationController

  def index
    @landscape_pictures = Picture.all_landscapes
  end
end