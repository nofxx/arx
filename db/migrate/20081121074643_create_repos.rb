class CreateRepos < ActiveRecord::Migration
  def self.up
    create_table :repos do |t|
      t.references :pkg, :null => false
      t.references :user
      t.string :path, :null => false

      t.integer :builds_count

      t.timestamps
    end

    add_index :repos, [:pkg_id, :user_id]
    add_index :repos, :pkg_id
    add_index :repos, :user_id
  end

  def self.down
    drop_table :repos
  end
end
