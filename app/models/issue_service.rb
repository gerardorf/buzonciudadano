class IssueService

  def initialize(repository=IssueRepository.new)
    @repository = repository
  end

  def add(issue_request)
    issue = Issue.new(issue_request.text, issue_request.summary,
              issue_request.fullname, issue_request.address,
              issue_request.images, issue_request.email, issue_request.dni)

    @repository.put(issue)
    return issue
  end
end

