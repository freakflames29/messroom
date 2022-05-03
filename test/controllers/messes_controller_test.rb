require "test_helper"

class MessesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get messes_new_url
    assert_response :success
  end

  test "should get index" do
    get messes_index_url
    assert_response :success
  end

  test "should get create" do
    get messes_create_url
    assert_response :success
  end

  test "should get update" do
    get messes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get messes_destroy_url
    assert_response :success
  end
end
