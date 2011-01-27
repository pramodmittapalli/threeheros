class CreateCelebrities < ActiveRecord::Migration
  def self.up
    create_table :celebrities do |t|
      t.string :name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
    add_index :celebrities, :user_id
  end

  def self.down
    drop_table :celebrities
  end
end
