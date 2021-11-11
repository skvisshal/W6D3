class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.integer :user_id, null: false
      t.string  :label, null: false

      t.timestamps
    end
    add_index :collections, :user_id
  end
end
