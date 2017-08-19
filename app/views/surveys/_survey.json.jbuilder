json.extract! survey, :id, :survey_ref, :date, :district, :road_name, :from, :to, :latitude, :longitude, :road_class, :road_type, :up_no_of_lanes, :up_lane_width, :up_distance_to_junction, :up_junction_type, :up_signalized, :down_no_of_lanes, :down_lane_width, :down_distance_to_junction, :down_junction_type, :down_signalized, :created_at, :updated_at
json.url survey_url(survey, format: :json)
