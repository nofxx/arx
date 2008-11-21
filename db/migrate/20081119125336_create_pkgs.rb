class CreatePkgs < ActiveRecord::Migration
  def self.up
    create_table :pkgs do |t|
      t.references :owner
      t.string :name, :null => false
      t.text :desc, :null => false
      t.integer :weight, :null => false, :default => 0

      t.string :license, :url, :md5
      t.integer :size, :dl_size, :arch

      t.timestamp :build_date

      t.timestamps
    end

    add_index :pkgs, :name
    add_index :pkgs, :owner_id
  end

  def self.down
    drop_table :pkgs
  end
end
