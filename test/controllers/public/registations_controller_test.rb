require "test_helper"

class Public::RegistationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_registations_new_url
    assert_response :success
  end

  test "should get create" do
    get public_registations_create_url
    assert_response :success
  end
end
