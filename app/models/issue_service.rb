class IssueService

  def initialize(repository=IssueRepository.new)
    @issues = repository
  end

  def add(issue_request)
    issue = Issue.new(issue_request.text, issue_request.summary,
              issue_request.fullname, issue_request.address,
              issue_request.images, issue_request.email, issue_request.dni)

    @issues.put(issue)
    return issue
  end

  def confirm(unique_id)
    issue = @issues.find_by_uuid(unique_id)
    @issues.confirm(issue)
  end
end
