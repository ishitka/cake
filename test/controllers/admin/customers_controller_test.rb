require "test_helper"

class Admin::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get iundex" do
    get admin_customers_iundex_url
    assert_response :success
  end

  test "should get show" do
    get admin_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_customers_edit_url
    assert_response :success
  end
end
