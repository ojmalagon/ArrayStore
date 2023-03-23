require "test_helper"

class ArrayManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get array_manager_index_url
    assert_response :success
  end
end
