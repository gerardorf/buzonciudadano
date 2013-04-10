require 'rspec'
require 'pg'
require_relative '../../app/models/issue_repo'
require_relative '../../app/models/issue'

 describe 'IssueRepo' do
  it 'saves an issue' do
    conn = PG.connect( dbname: 'buzonciudadano_test', host: '127.0.0.1', port: 5432 )
    repo = IssueRepo.new
    repo.connection = conn

    issue = Issue.new({
      :text => 'a text',
      :summary => 'a summary',
      :fullname => 'the name',
      :address => 'an address',
      :images => ['image one', 'image two']})
    repo.save(issue)

    result = conn.exec( "SELECT * FROM issues" )
    result.getvalue(0, 1).should eql 'a text'
    result.getvalue(0, 2).should eql 'a summary'
    result.getvalue(0, 3).should eql 'the name'
    result.getvalue(0, 4).should eql 'an address'
    result.getvalue(0, 5).should eql 'image one,image two'

    conn.exec("DELETE FROM issues")
  end
end
