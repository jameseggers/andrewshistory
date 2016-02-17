json.array!(@students) do |student|
  json.extract! student, :id, :age, :registerNumber, :pupilForname, :pupilSurname, :pupilAddress, :parentSurname, :parentsOccupation, :pupilReligion, :monthlyAttendanceTotal, :yearlyAttendanceTotal, :additionalNotes
  json.url student_url(student, format: :json)
end
