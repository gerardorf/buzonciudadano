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

  private

  def an_issue
    Issue.new('a text', 'a summary', 'fullname', 'address', [])
  end
end
