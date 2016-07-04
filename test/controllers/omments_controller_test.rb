require 'test_helper'

class OmmentsControllerTest < ActionController::TestCase
  setup do
    @omment = omments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omment" do
    assert_difference('Omment.count') do
      post :create, omment: { article_id: @omment.article_id, body: @omment.body, user_id: @omment.user_id }
    end

    assert_redirected_to omment_path(assigns(:omment))
  end

  test "should show omment" do
    get :show, id: @omment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omment
    assert_response :success
  end

  test "should update omment" do
    patch :update, id: @omment, omment: { article_id: @omment.article_id, body: @omment.body, user_id: @omment.user_id }
    assert_redirected_to omment_path(assigns(:omment))
  end

  test "should destroy omment" do
    assert_difference('Omment.count', -1) do
      delete :destroy, id: @omment
    end

    assert_redirected_to omments_path
  end
end
