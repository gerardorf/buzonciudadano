require 'rspec'
require_relative '../../app/models/issue'
require_relative '../../app/models/issue_domain'

describe 'IssueDomain' do
  before :each do
    @domain = IssueDomain.new
    @repo = double('repo')
    @domain.repository = @repo
    @repo.stub(:save)
  end

  it 'creates an issue' do
    issue = @domain.create({:text => 'a text'})

    issue.to_hash[:identity].should_not be_nil
  end

  it 'saves an issue' do
    @repo.should_receive(:save)

    issue = @domain.create({:text => 'a text'})
  end
end
