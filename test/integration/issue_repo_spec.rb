require 'rspec'
require 'pg'


 describe 'IssueRepo' do

  it 'saves an issue' do

    conn = PG.connect( dbname: 'buzonciudadano_test' )

    repo = IssueRepo.new
    repo.connection = conn

    issue = Issue.new({:text => 'a text'})

    repo.save(issue)

    result = conn.exec( "SELECT * FROM issues" )
    result.getValue(0, 'text').should eql 'a text'

  end


end

