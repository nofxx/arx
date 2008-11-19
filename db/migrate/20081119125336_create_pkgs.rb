class CreatePkgs < ActiveRecord::Migration
  def self.up
    create_table :pkgs do |t|
      t.string :name, :null => false
      t.text :desc, :null => false
      t.integer :weight, :null => false, :default => 0
      t.references :maintainer
      t.string :repo

      t.timestamps
    end

    add_index :pkgs, :name
    add_index :pkgs, :maitainer
  end

  def self.down
    drop_table :pkgs
  end
end
