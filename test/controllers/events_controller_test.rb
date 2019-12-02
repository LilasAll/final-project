require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get indew" do
    get events_indew_url
    assert_response :success
  end

  test "should get show" do
    get events_show_url
    assert_response :success
  end

  test "should get create" do
    get events_create_url
    assert_response :success
  end

end
