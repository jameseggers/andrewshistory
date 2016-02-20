class Addstudenttable < ActiveRecord::Migration
  def change
	create_table :students do |t|
		t.float :age
		t.integer :registerNumber
		t.string :pupilForname
		t.string :pupilSurname
		t.string :pupilAddress
		t.string :parentSurname
		t.string :parentsOccupation
		t.string :pupilReligion
		t.integer :monthlyAttendanceTotal
		t.integer :yearlyAttendanceTotal
		t.string :additionalNotes

	end
  end
end
