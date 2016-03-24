namespace :import do
	desc "Imports data from a csv file"
	task :data => :environment do
		require 'pg'
		require 'csv'
		if ARGV.length!=2
			puts "Usage: rake import:data <filepath>"
			exit
		end
		k = 0;
		con = PG.connect :dbname => 'andrewshistory_development', :user => 'jameseggers'
		CSV.foreach(ARGV[1]) do |row|
			string = ""
			columnString = ""
			row[0] = k.to_s
			if row[12] === nil
				row[12] = Time.new.to_s
			end
			row[13] = Time.new.to_s
			for i in 0..13
				if row[i] != nil and row[i].downcase==="not specified"
					row[i] = nil
				end

				if row[i]!= nil
					row[i].gsub!('\'', '’')
					string = string + "'" + row[i] + "',"
					case i
					when 0
						columnString = columnString + "id,"
					when 1
						columnString = columnString + "age,"
					when 2
						columnString = columnString + "registerNumber,"
					when 3
						columnString = columnString + "pupilForname,"
					when 4
						columnString = columnString + "pupilSurname,"
					when 5
						columnString = columnString + "pupilAddress,"
					when 6
						columnString = columnString + "parentSurname,"
					when 7
						columnString = columnString + "parentsOccupation,"
					when 8
						columnString = columnString + "pupilReligion,"
					when 9
						columnString = columnString + "monthlyAttendanceTotal,"
					when 10
						columnString = columnString + "yearlyAttendanceTotal,"
					when 11
					 	columnString = columnString + "additionalNotes,"
					when 12
						columnString = columnString + "created_at,"
					when 13
						columnString = columnString + "updated_at,"
					end

				end

			end

			if row[1]!=nil and row[2]!='Register Number'
				con.exec 'INSERT INTO students ("' + columnString.chomp(",").gsub(',', '","') + '") VALUES(' + string.chomp(",") + ');'
			end
			k = k + 1
		end
		con.close
	end
end
