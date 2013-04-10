class IssueController < ApplicationController
  def create
    render :json => { :success => true }
  end
end
