class AddTimeStampsToNotes < ActiveRecord::Migration[5.0]
def change_table 
	add_column(:note, :created_at, :datetime) 
	add_column(:note, :updated_at, :datetime) 
end 
end
