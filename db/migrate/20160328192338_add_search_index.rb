class AddSearchIndex < ActiveRecord::Migration
  def up
    Student.connection.execute("CREATE INDEX \"pupilAddress_idx\" ON students USING gin(to_tsvector('english', \"pupilAddress\"));")
  end

  def down
    remove_index :students, name: "pupilAddress_idx"
  end
end
