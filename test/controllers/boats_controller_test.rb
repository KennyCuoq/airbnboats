require 'test_helper'

class BoatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boats_index_url
    assert_response :success
  end

  test "should get show" do
    get boats_show_url
    assert_response :success
  end

  test "should get new" do
    get boats_new_url
    assert_response :success
  end

  test "should get create" do
    get boats_create_url
    assert_response :success
  end

  test "should get destroy" do
    get boats_destroy_url
    assert_response :success
  end

end
