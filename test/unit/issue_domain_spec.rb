require 'rspec'
require_relative '../../app/models/issue'
require_relative '../../app/models/issue_domain'

describe 'IssueDomain' do
  it 'creates an issue' do
    domain = IssueDomain.new
    repo = double('repo')
    domain.repository = repo
    repo.stub(:save)

    issue = domain.create({:text => 'a text'})
    issue.to_hash[:identity].should_not be_nil
  end

  it 'saves an issue' do
    domain = IssueDomain.new
    repo = double('repo')
    domain.repository = repo
    repo.should_receive(:save)

    issue = domain.create({:text => 'a text'})
  end
end
