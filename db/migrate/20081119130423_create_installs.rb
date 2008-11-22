class CreateInstalls < ActiveRecord::Migration
  def self.up
    create_table :installs do |t|
      t.references :repo, :null => false
      t.boolean :code, :null => false

      t.timestamps
    end

    add_index :installs, :repo_id
    add_index :installs, :code
  end

  def self.down
    drop_table :installs
  end
end
