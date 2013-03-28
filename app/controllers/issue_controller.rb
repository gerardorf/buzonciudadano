class IssueController < ApplicationController

  def create

    p params.inspect
    # create issue object - from issue domain


    render :json => { :success => true }
  end


end
