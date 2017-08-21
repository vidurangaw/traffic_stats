class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string   :survey_ref
      t.date     :date, index: true
      t.string   :district
      t.string   :road_name
      t.string   :from
      t.string   :to
      t.decimal  :latitude, {:precision=>10, :scale=>6}
      t.decimal  :longitude, {:precision=>10, :scale=>6}
      t.string   :road_class
      t.string   :road_type      
      t.integer  :no_of_lanes
      t.decimal  :lane_width, {:precision=>10, :scale=>3}
      t.string   :shoulder_type
      t.decimal  :shoulder_width, {:precision=>10, :scale=>3}
      t.string   :pavement_condition
      t.string   :built_environment    
      t.decimal  :row, {:precision=>10, :scale=>1}
      t.integer  :speed_limit
      t.integer  :ffs
      t.string   :traffic_composition
      t.string   :access_point_density
      t.string   :up_grade
      t.decimal  :up_distance_to_junction, {:precision=>10, :scale=>3}
      t.string   :up_junction_type
      t.boolean  :up_signalized, default: false     
      t.string   :down_grade 
      t.decimal  :down_distance_to_junction, {:precision=>10, :scale=>3}
      t.string   :down_junction_type
      t.boolean  :down_signalized, default: false

      t.timestamps
    end
  end
end
