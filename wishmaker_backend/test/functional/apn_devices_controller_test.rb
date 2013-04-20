require 'test_helper'

class ApnDevicesControllerTest < ActionController::TestCase
  setup do
    @apn_device = apn_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apn_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apn_device" do
    assert_difference('ApnDevice.count') do
      post :create, apn_device: {  }
    end

    assert_redirected_to apn_device_path(assigns(:apn_device))
  end

  test "should show apn_device" do
    get :show, id: @apn_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apn_device
    assert_response :success
  end

  test "should update apn_device" do
    put :update, id: @apn_device, apn_device: {  }
    assert_redirected_to apn_device_path(assigns(:apn_device))
  end

  test "should destroy apn_device" do
    assert_difference('ApnDevice.count', -1) do
      delete :destroy, id: @apn_device
    end

    assert_redirected_to apn_devices_path
  end
end
