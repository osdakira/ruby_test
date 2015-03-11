require 'test_helper'

class UsersItemsControllerTest < ActionController::TestCase
  setup do
    @users_item = users_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_item" do
    assert_difference('UsersItem.count') do
      post :create, users_item: { item_id: @users_item.item_id, user_id: @users_item.user_id }
    end

    assert_redirected_to users_item_path(assigns(:users_item))
  end

  test "should show users_item" do
    get :show, id: @users_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_item
    assert_response :success
  end

  test "should update users_item" do
    patch :update, id: @users_item, users_item: { item_id: @users_item.item_id, user_id: @users_item.user_id }
    assert_redirected_to users_item_path(assigns(:users_item))
  end

  test "should destroy users_item" do
    assert_difference('UsersItem.count', -1) do
      delete :destroy, id: @users_item
    end

    assert_redirected_to users_items_path
  end
end
