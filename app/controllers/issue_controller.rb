require 'ostruct'
require 'issue_service'

class IssueController < ApplicationController
  def create
    render json: { success: true, issue: issue_data }
  end

  def summary
    @summary = params['summary']
    @fullname = params['fullname']

    @dni = params['dni']
    @email = params['email']

    render "buzon/sugerencia"
  end

  def confirm
    IssueService.new.confirm(params[:uuid])

    render "buzon/thanksforconfirm"
  end

  private

  def issue_data
    make_issue_data(make_issue)
  end

  def make_issue
    new_issue = IssueService.new.add(issue_request)
    IssueMailer.new_issue(new_issue.email, new_issue.fullname,new_issue.uuid).deliver
    return new_issue
  end

  def issue_request
    OpenStruct.new(params)
  end

  def make_issue_data(issue)
    {text: issue.text, summary: issue.summary, fullname: issue.fullname,
     address: issue.address, images: issue.images, dni: issue.dni, email: issue.email}
  end
end
