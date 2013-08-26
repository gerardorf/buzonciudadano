class IssueRepository

  def initialize(connection=ActiveRecord::Base.connection.raw_connection)
    @connection = connection
  end

  def put(issue)
    images = issue.images && issue.images.join(',')
    @connection.exec(insert_query, [issue.text, issue.summary, issue.fullname,
                                    issue.address, images, issue.dni, issue.email])
  end

  private

  def insert_query
    'INSERT INTO issues (text, summary, fullname, address, images, dni, email) VALUES
    ($1, $2, $3, $4, $5, $6, $7)'
  end
end

