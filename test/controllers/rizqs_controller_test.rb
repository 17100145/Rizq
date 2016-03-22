require 'test_helper'

class RizqsControllerTest < ActionController::TestCase
  setup do
    @rizq = rizqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rizqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rizq" do
    assert_difference('Rizq.count') do
      post :create, rizq: { action: @rizq.action, address: @rizq.address, area: @rizq.area, date: @rizq.date, food: @rizq.food, perishable: @rizq.perishable, quantity: @rizq.quantity, time: @rizq.time }
    end

    assert_redirected_to rizq_path(assigns(:rizq))
  end

  test "should show rizq" do
    get :show, id: @rizq
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rizq
    assert_response :success
  end

  test "should update rizq" do
    patch :update, id: @rizq, rizq: { action: @rizq.action, address: @rizq.address, area: @rizq.area, date: @rizq.date, food: @rizq.food, perishable: @rizq.perishable, quantity: @rizq.quantity, time: @rizq.time }
    assert_redirected_to rizq_path(assigns(:rizq))
  end

  test "should destroy rizq" do
    assert_difference('Rizq.count', -1) do
      delete :destroy, id: @rizq
    end

    assert_redirected_to rizqs_path
  end
end
