class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.references :pkg
      t.string :name
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :versions
  end
end
