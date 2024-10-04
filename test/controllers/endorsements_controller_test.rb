require "test_helper"

class EndorsementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get endorsements_index_url
    assert_response :success
  end
end
