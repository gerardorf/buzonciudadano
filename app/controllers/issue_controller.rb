require 'ostruct'
require 'issue_service'

class IssueController < ApplicationController
  def create
    render json: { success: true, issue: issue_data }
  end

  private
  
  def issue_data
    make_issue_data(make_issue)
  end

  def make_issue
    IssueService.new.add(issue_request)
  end

  def issue_request
    OpenStruct.new(params)
  end

  def make_issue_data(issue)
    {text: issue.text, summary: issue.summary, fullname: issue.fullname,
     address: issue.address, images: issue.images}
  end
end
