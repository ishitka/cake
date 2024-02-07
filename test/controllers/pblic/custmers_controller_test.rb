require "test_helper"

class Pblic::CustmersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pblic_custmers_show_url
    assert_response :success
  end

  test "should get edit" do
    get pblic_custmers_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get pblic_custmers_confirm_url
    assert_response :success
  end
end
