class LandscapePicturesController < ApplicationController

  def index
    @landscape_pictures = Pictures.all_landscapes
  end
end