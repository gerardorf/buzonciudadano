class IssueDomain
  attr_writer :repository

  def create(properties)
    issue = Issue.new(properties)
    get_repository.save(issue)
    issue
  end

  def get_repository
    @repository = IssueRepo.new if @repository == nil
    @repository
  end
end
