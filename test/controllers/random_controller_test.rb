require "test_helper"

class RandomControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get random_new_url
    assert_response :success
  end

  test "should get find" do
    get random_find_url
    assert_response :success
  end
end
