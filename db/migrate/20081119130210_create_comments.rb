class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :commentable_id, :default => 0, :null => false
      t.string :commentable_type, :limit => 15, :default => "", :null => false

      t.references :user, :null => false
      t.text :content, :null => false

      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, :user_id
  end

  def self.down
    drop_table :comments
  end
end
