namespace :import do
	desc "Imports data from a csv file"
	task :data => :environment do
		require "pg"
		require "csv"
		if ARGV.length!=2
			puts "Usage: rake import:data <filepath>"
			exit
		end
		k = 0;
		con = PG.connect :dbname => "andrewshistory_development", :user => "jameseggers"
		counter = 0
		CSV.foreach(ARGV[1]) do |row|
			if counter > 0
				puts row.inspect
				row[5] = Date.parse(row[5]) if row[5]
				Student.create(age: row[0], registerNumber: row[1], pupilForname: row[2], pupilSurname: row[3], pupilAddress: row[4], dateOfEntry: row[5], pupilClass: row[6], parentForname: row[7], parentSurname: row[8], parentsOccupation: row[9], pupilReligion: row[10], additionalNotes: row[11])
			end
			counter += 1
		end
		con.close
	end
end
