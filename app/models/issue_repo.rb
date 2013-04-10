class IssueRepo
  attr_writer :connection

  def save(issue)
    data = issue.to_hash
    images = data[:images].join(',') if data[:images] != nil

    get_connection.exec('INSERT INTO issues (text, summary, fullname, address, images)
      VALUES ($1, $2, $3, $4, $5)', [data[:text], data[:summary], data[:fullname],
                                     data[:address], images])
  end

  def get_connection
    @connection = ActiveRecord::Base.connection.raw_connection if @connection == nil
    @connection
  end
end
