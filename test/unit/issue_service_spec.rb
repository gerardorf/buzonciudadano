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

  it 'confirms an issue' do
    repository.should_receive(:find_by_uuid).with('a unique id').and_return('an issue')
    repository.should_receive(:confirm).with('an issue')

    service.confirm('a unique id')
  end

  private

  def an_issue
    Issue.new('a text', 'a summary', 'fullname', 'address', [])
  end
end
