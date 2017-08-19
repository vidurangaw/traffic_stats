class Survey < ApplicationRecord
	require 'axlsx'
	include PgSearch

	has_many :up_vehicle_stats, -> { where type: :up }, class_name: 'VehicleStat'
	has_many :down_vehicle_stats, -> { where type: :down }, class_name: 'VehicleStat'

	validates_presence_of :date, :district, :road_name, :from, :to, :road_class, :road_type, :no_of_lanes

	pg_search_scope :search, against: [:survey_ref, :road_name, :from, :to]

end
