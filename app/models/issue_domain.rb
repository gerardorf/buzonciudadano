class IssueDomain
  attr_writer :repository

  def create(properties)
    issue = Issue.new(properties)
    @repository.save(issue)
    issue
  end
end
