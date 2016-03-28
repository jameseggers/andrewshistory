class AddMissingColumns < ActiveRecord::Migration
  def change
    add_column :students, :pupilClass, :string
    add_column :students, :dateOfEntry, :datetime
    add_column :students, :parentForname, :string
  end
end
