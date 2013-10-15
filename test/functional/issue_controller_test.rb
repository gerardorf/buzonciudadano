require 'test_helper'
require 'mocha'

class IssueControllerTest < ActionController::TestCase
  test "should post an issue" do
    post :create, {:text => 'a text', :summary => 'a summary', :images => ['image1'] }
    assert_response :success
    response = JSON.parse(@response.body)
    assert_equal response["issue"], {
      "text" => 'a text',
      "summary" => 'a summary',
      "fullname" => nil,
      "address" => nil,
      "images" => ['image1'],
      "dni"=>nil,
      "email"=>nil
    }
  end

  test "should send an email when post a new issue" do
    IssueMailer.any_instance.expects(:new_issue)
    post :create, {:text => 'a text', :summary => 'a summary', :images => ['image1'], }
  end
end
