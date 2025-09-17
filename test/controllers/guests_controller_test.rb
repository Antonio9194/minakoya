require "test_helper"

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guests_index_url
    assert_response :success
  end

  test "should get show" do
    get guests_show_url
    assert_response :success
  end
end
