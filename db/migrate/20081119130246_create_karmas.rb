class CreateKarmas < ActiveRecord::Migration
  def self.up
    create_table :karmas do |t|
      t.references :repo, :null => false
      t.integer :value, :null => false
      t.references :user, :null => false


      t.timestamps
    end
    add_index :karmas, :repo_id
  end

  def self.down
    drop_table :karmas
  end
end
