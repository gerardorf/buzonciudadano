require 'test_helper'

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
    }
  end
end
