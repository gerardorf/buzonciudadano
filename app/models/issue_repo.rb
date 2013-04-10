class IssueRepo
  attr_writer :connection

  def save(issue)
    data = issue.to_hash
    @connection.exec('INSERT INTO issues (text, summary, fullname, address, images)
      VALUES ($1, $2, $3, $4, $5)', [data[:text], data[:summary], data[:fullname],
                                     data[:address], data[:images].join(',')])
  end
end
