class IssueRepository

  def initialize(connection=ActiveRecord::Base.connection.raw_connection)
    @connection = connection
  end

  def put(issue)
    images = issue.images && issue.images.join(',')
    @connection.exec(insert_query, [issue.text, issue.summary, issue.fullname,
                                    issue.address, images])
  end

  private

  def insert_query
    'INSERT INTO issues (text, summary, fullname, address, images) VALUES
    ($1, $2, $3, $4, $5)'
  end
end

