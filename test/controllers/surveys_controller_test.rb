require 'test_helper'

class SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = surveys(:one)
  end

  test "should get index" do
    get surveys_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_url
    assert_response :success
  end

  test "should create survey" do
    assert_difference('Survey.count') do
      post surveys_url, params: { survey: { date: @survey.date, district: @survey.district, down_distance_to_junction: @survey.down_distance_to_junction, down_junction_type: @survey.down_junction_type, down_lane_width: @survey.down_lane_width, down_no_of_lanes: @survey.down_no_of_lanes, down_signalized: @survey.down_signalized, from: @survey.from, latitude: @survey.latitude, longitude: @survey.longitude, road_class: @survey.road_class, road_name: @survey.road_name, road_type: @survey.road_type, survey_ref: @survey.survey_ref, to: @survey.to, up_distance_to_junction: @survey.up_distance_to_junction, up_junction_type: @survey.up_junction_type, up_lane_width: @survey.up_lane_width, up_no_of_lanes: @survey.up_no_of_lanes, up_signalized: @survey.up_signalized } }
    end

    assert_redirected_to survey_url(Survey.last)
  end

  test "should show survey" do
    get survey_url(@survey)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_url(@survey)
    assert_response :success
  end

  test "should update survey" do
    patch survey_url(@survey), params: { survey: { date: @survey.date, district: @survey.district, down_distance_to_junction: @survey.down_distance_to_junction, down_junction_type: @survey.down_junction_type, down_lane_width: @survey.down_lane_width, down_no_of_lanes: @survey.down_no_of_lanes, down_signalized: @survey.down_signalized, from: @survey.from, latitude: @survey.latitude, longitude: @survey.longitude, road_class: @survey.road_class, road_name: @survey.road_name, road_type: @survey.road_type, survey_ref: @survey.survey_ref, to: @survey.to, up_distance_to_junction: @survey.up_distance_to_junction, up_junction_type: @survey.up_junction_type, up_lane_width: @survey.up_lane_width, up_no_of_lanes: @survey.up_no_of_lanes, up_signalized: @survey.up_signalized } }
    assert_redirected_to survey_url(@survey)
  end

  test "should destroy survey" do
    assert_difference('Survey.count', -1) do
      delete survey_url(@survey)
    end

    assert_redirected_to surveys_url
  end
end
