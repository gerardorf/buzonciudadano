class IssueService

  def initialize(repository=IssueRepository.new)
    @issue_repository = repository
  end

  def add(issue_data)
    issue = Issue.new(issue_data.text, issue_data.summary, issue_data.fullname,
      issue_data.address, issue_data.images, issue_data.email, issue_data.dni)
    @issue_repository.put(issue)
    issue
  end

  def confirm(uuid)
    issue = @issue_repository.find_by_uuid(uuid)
    @issue_repository.confirm(issue)
  end
end
