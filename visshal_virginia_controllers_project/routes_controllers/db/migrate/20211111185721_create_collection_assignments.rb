class CreateCollectionAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_assignments do |t|
      t.integer :collection_id, null: false
      t.integer :artwork_id, null: false

      t.timestamps
    end
    add_index :collection_assignments, [:collection_id, :artwork_id], unique: true
  end
end
