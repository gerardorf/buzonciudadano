require 'issue_domain'

class IssueController < ApplicationController
  def create
    domain = IssueDomain.new
    issue = domain.create(params)

    render :json => { :success => true, :issue => issue.to_hash }
  end
end
