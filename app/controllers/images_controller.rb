class ImagesController < ApplicationController
  def get
    "http://placeskull.com/170/170"
  end

  def new
    render :json => { :url => "http://placeskull.com/170/170", :success => true }
  end
end
