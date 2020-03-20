require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    #get users_show_url
    get user_url(users(:one))
    assert_response :success
  end

end
