class VehicleStat < ApplicationRecord
	require 'roo'
 	self.inheritance_column = "_type"

  default_scope { order(id: :asc) }

 	belongs_to :survey

	def self.import(survey, file)
	  spreadsheet = open_spreadsheet(file)	    

	  survey.up_vehicle_stats.destroy_all
	  survey.down_vehicle_stats.destroy_all
	  (1..2).each do |sheet_no|
	  	sheet = spreadsheet.sheet("Data_#{sheet_no}")	  	

		  (6..85).each do |row_no|
		  	time = sheet.excelx_value(row_no, 1).gsub(".", ":").split("-")
	 			counts = sheet.row(row_no)[1, 14].map(&:to_i)
        total = sheet.excelx_value(row_no, 16).to_i 

	 			if (time[1].to_time - time[0].to_time)/1.minute == 15.0
			  	data = {
			  		from: time[0],
			  		to: time[1],
			  		total: total > 0 ? total : counts.sum
			  	}	  	

			  	counts_hash = Hash[VehicleStat.column_names[5, 14].zip counts]
			  	data = data.merge(counts_hash)

			  	if sheet_no == 1
						survey.up_vehicle_stats.create(data)
			  	elsif sheet_no == 2
			  		survey.down_vehicle_stats.create(data)
			  	end  	
			  end	  	

		  end
		end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)	  
	  when ".xlsx" 
	  	then Roo::Excelx.new(file.path)
	  else 
	  	raise "Unknown file type: #{file.original_filename}"
	  end
	end
end
