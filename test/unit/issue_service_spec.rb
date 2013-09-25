require 'rspec'
require_relative '../../app/models/issue'
require_relative '../../app/models/issue_service'

describe IssueService do
  let(:repository) { double('repository') }
  let(:service) { described_class.new(repository) }

  it 'adds an issue' do
    expected_issue = an_issue
    repository.should_receive(:put).with(expected_issue)

    service.add(an_issue)
  end

  it 'validates an issue' do
    repository.should_receive(:find_by_uuid).with('a unique id').and_return("an issue")

    expect(service.validate('a unique id')).to be_true
  end

  it 'fail at validating an issue' do
    repository.should_receive(:find_by_uuid).with('an invalid id').and_return(nil)

    expect(service.validate('an invalid id')).to be_false
  end

  private

  def an_issue
    Issue.new('a text', 'a summary', 'fullname', 'address', [])
  end
end
