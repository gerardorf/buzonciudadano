class ImagesController < ApplicationController
  include ImagesHelper

  def new
    url = upload
    render :json => { :url => url, :success => true }
  end
end
