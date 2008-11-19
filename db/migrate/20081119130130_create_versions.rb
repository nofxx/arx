class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.references :pkg, :null => false
      t.string :name, :null => false
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :versions
  end
end
