namespace :import do
	desc "Imports data from a csv file"
	task :data => :environment do
		require 'pg'
		require 'csv'
		k = 0;
		con = PG.connect :dbname => 'andrewshistory_development', :user => 'ben'
		CSV.foreach('/home/ben/Desktop/rollbook.csv') do |row|
			for i in 0..13
				if row[i] === nil or row[i].downcase==="not specified"
					row[i] = '-1'
				end
				row[i].gsub!('\'', '’')
			end
			id = k.to_s
 			age = row[1]
 			registerNumber = row[2]
 			pupilForname = row[3]
 			pupilSurname = row[4]
 			pupilAddress = row[5]
 			parentSurname = row[6] 
 			parentsOccupation = row[7]
 			pupilReligion = row[8]
 			monthlyAttendanceTotal= row[9]
 			yearlyAttendanceTotal = row[10]
 			additionalNotes = row[11] 
 			created_at = row[12]
			updated_at = row[13]

			if created_at === '-1'
				created_at = '2016-01-01'
			end
			if updated_at === '-1'
				updated_at = '2016-01-01'
			end

			if row[1]!='-1' and row[2]!='Register Number'
				con.exec "INSERT INTO students VALUES(" + id +"," + age+ ","+registerNumber+",'"+pupilForname+"','"+pupilSurname+"','"+
				pupilAddress+"','"+parentSurname+"','"+parentsOccupation+"','"+pupilReligion+"',"+monthlyAttendanceTotal+","+
				yearlyAttendanceTotal+",'"+additionalNotes+"','"+created_at+"','"+updated_at+"');"
			end
			k = k + 1
		end
		con.close
	end
end