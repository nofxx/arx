class CreatePkgs < ActiveRecord::Migration
  def self.up
    create_table :pkgs do |t|
      t.string :name, :null => false
      t.text :desc, :null => false
      t.integer :rank, :null => false, :default => 0

      t.string :license, :url, :md5, :website
      t.boolean :x32, :x64
      t.integer :size, :dl_size, 
        :repos_count, :builds_count, :versions_count

      t.timestamp :build_date

      t.timestamps
    end

    add_index :pkgs, :name, :unique => true
    add_index :pkgs, :rank
    add_index :pkgs, :build_date
  end

  def self.down
    drop_table :pkgs
  end
end
