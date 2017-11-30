require 'test_helper'

class TreatmentsControllerTest < ActionController::TestCase
  setup do
    @treatment = treatments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treatments)
  end

  test "should create treatment" do
    assert_difference('Treatment.count') do
      post :create, treatment: { description: @treatment.description, isdiagnosed: @treatment.isdiagnosed, patient_id: @treatment.patient_id }
    end

    assert_response 201
  end

  test "should show treatment" do
    get :show, id: @treatment
    assert_response :success
  end

  test "should update treatment" do
    put :update, id: @treatment, treatment: { description: @treatment.description, isdiagnosed: @treatment.isdiagnosed, patient_id: @treatment.patient_id }
    assert_response 204
  end

  test "should destroy treatment" do
    assert_difference('Treatment.count', -1) do
      delete :destroy, id: @treatment
    end

    assert_response 204
  end
end
