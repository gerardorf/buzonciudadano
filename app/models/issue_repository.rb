class IssueRepository

  def initialize(connection=ActiveRecord::Base.connection.raw_connection)
    @connection = connection
  end

  def put(issue)
    @connection.exec(insert_query, [issue.text, issue.summary, issue.fullname,
                                    issue.address, issue.images.join(',')])
  end

  private

  def insert_query
    'INSERT INTO issues (text, summary, fullname, address, images) VALUES
    ($1, $2, $3, $4, $5)'
  end
end

