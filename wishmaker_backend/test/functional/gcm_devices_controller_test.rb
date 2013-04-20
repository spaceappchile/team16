require 'test_helper'

class GcmDevicesControllerTest < ActionController::TestCase
  setup do
    @gcm_device = gcm_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gcm_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gcm_device" do
    assert_difference('GcmDevice.count') do
      post :create, gcm_device: {  }
    end

    assert_redirected_to gcm_device_path(assigns(:gcm_device))
  end

  test "should show gcm_device" do
    get :show, id: @gcm_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gcm_device
    assert_response :success
  end

  test "should update gcm_device" do
    put :update, id: @gcm_device, gcm_device: {  }
    assert_redirected_to gcm_device_path(assigns(:gcm_device))
  end

  test "should destroy gcm_device" do
    assert_difference('GcmDevice.count', -1) do
      delete :destroy, id: @gcm_device
    end

    assert_redirected_to gcm_devices_path
  end
end
