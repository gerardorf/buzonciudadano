require 'rspec'
require 'pg'
require_relative '../../app/models/issue_repository'
require_relative '../../app/models/issue'

 describe IssueRepository do

  let(:conn){ conn = PG.connect( dbname: 'buzonciudadano_test',
                host: '127.0.0.1', port: 5432, user:'buzonciudadano',
                password: 'buzon' )}
  let(:repo){ described_class.new(conn) }

  after(:each){ conn.exec("DELETE FROM issues") }

  it 'puts' do

    issue = Issue.new('a text', 'a summary', 'the name', 'an address', ['image one', 'image two'])
    repo.put(issue)

    result = conn.exec( "SELECT * FROM issues" )
    result.getvalue(0, 1).should eql 'a text'
    result.getvalue(0, 2).should eql 'a summary'
    result.getvalue(0, 3).should eql 'the name'
    result.getvalue(0, 4).should eql 'an address'
    result.getvalue(0, 5).should eql 'image one,image two'

  end

  it 'finds by uuid' do
    issue = Issue.new('a text', 'a summary', 'the name',
      'an address', ['image one', 'image two'])
    repo.put(issue)

    found_issue = repo.find_by_uuid(issue.uuid)

    expect(issue.uuid).to eq(found_issue.uuid)
  end

  it 'fails at finding by uuid' do
    found_issue = repo.find_by_uuid('an uuid')

    expect(found_issue.uuid).to eq('')
  end

  it 'validates' do
    issue = Issue.new('a text', 'a summary', 'the name',
      'an address', ['image one', 'image two'])
    repo.put(issue)

    expect(issue.confirmed?).to be_false

    repo.confirm(issue)

    confirmed_issue = repo.find_by_uuid(issue.uuid)
    expect(confirmed_issue.confirmed?).to be_true
  end

end
