class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :user, :null => false
      t.references :pkg, :null => false
      t.text :content, :null => false

      t.timestamps
    end
    add_index :comments, [:user_id, :pkg_id]
  end

  def self.down
    drop_table :comments
  end
end
