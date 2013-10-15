class ImagesController < ApplicationController
  include ImagesHelper

  def new
    image_url = upload_image
    render :json => { :url => image_url, :success => true }
  end
end
