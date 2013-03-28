require 'rspec'
require_relative '../../app/models/issue'

describe 'Issue' do
  it 'has a set of properties' do

    issue = Issue.new({:text => 'a text', :summary => 'a Summary',
        :fullname => 'the Name', :address => 'the Address',
        :images => ['image1', 'image2'], :notvalid => 'a value'})

    issue.to_hash[:text].should eql 'a text'
    issue.to_hash[:summary].should eql 'a Summary'
    issue.to_hash[:fullname].should eql 'the Name'
    issue.to_hash[:address].should eql 'the Address'
    issue.to_hash[:images].should eql ['image1', 'image2']
    issue.to_hash[:notvalid].should eql nil

  end

end