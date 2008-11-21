class CreateRepos < ActiveRecord::Migration
  def self.up
    create_table :repos do |t|
      t.references :user, :pkg, :null => false
      t.string :path, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :repos
  end
end
