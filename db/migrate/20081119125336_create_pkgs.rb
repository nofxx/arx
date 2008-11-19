class CreatePkgs < ActiveRecord::Migration
  def self.up
    create_table :pkgs do |t|
      t.string :name
      t.text :desc
      t.references :maintainer
      t.string :repo

      t.timestamps
    end
  end

  def self.down
    drop_table :pkgs
  end
end
