class CreateInstalls < ActiveRecord::Migration
  def self.up
    create_table :installs do |t|
      t.references :pkg, :null => false
      t.boolean :code, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :installs
  end
end
