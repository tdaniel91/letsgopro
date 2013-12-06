require 'test_helper'

class EnterprisesControllerTest < ActionController::TestCase
  setup do
    @enterprise = enterprises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enterprises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enterprise" do
    assert_difference('Enterprise.count') do
      post :create, enterprise: { address: @enterprise.address, admin_id: @enterprise.admin_id, areas: @enterprise.areas, email: @enterprise.email, foundation: @enterprise.foundation, history: @enterprise.history, name: @enterprise.name, phone: @enterprise.phone, projectos: @enterprise.projectos }
    end

    assert_redirected_to enterprise_path(assigns(:enterprise))
  end

  test "should show enterprise" do
    get :show, id: @enterprise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enterprise
    assert_response :success
  end

  test "should update enterprise" do
    patch :update, id: @enterprise, enterprise: { address: @enterprise.address, admin_id: @enterprise.admin_id, areas: @enterprise.areas, email: @enterprise.email, foundation: @enterprise.foundation, history: @enterprise.history, name: @enterprise.name, phone: @enterprise.phone, projectos: @enterprise.projectos }
    assert_redirected_to enterprise_path(assigns(:enterprise))
  end

  test "should destroy enterprise" do
    assert_difference('Enterprise.count', -1) do
      delete :destroy, id: @enterprise
    end

    assert_redirected_to enterprises_path
  end
end
