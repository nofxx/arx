class CreateBuilds < ActiveRecord::Migration
  def self.up
    create_table :builds do |t|
      t.references :repo, :pkg, :null => false
      t.references :user

      t.boolean :code, :null => false

      t.timestamps
    end

    add_index :builds, [:repo_id, :pkg_id]
    add_index :builds, :user_id
    add_index :builds, :code
  end

  def self.down
    drop_table :builds
  end
end
