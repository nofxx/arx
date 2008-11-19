class CreateInstalls < ActiveRecord::Migration
  def self.up
    create_table :installs do |t|
      t.references :pkg
      t.boolean :code

      t.timestamps
    end
  end

  def self.down
    drop_table :installs
  end
end
