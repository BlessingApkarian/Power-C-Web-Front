class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.integer :assignment_id
      t.string :assignment_name

      t.timestamps
    end
  end
end
