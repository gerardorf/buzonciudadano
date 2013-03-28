require 'rspec'
require_relative '../../app/models/issue'
require_relative '../../app/models/issue_domain'

describe 'IssueDomain' do
  it 'creates an issue' do

    domain = IssueDomain.new
    issue = domain.create({:text => 'a text'})

    issue.to_hash[:identity].should_not be_nil

  end

end