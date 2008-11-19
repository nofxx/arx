class CreateKarmas < ActiveRecord::Migration
  def self.up
    create_table :karmas do |t|
      t.references :pkg, :null => false
      t.integer :value, :null => false
      t.references :user, :null => false
      t.references :version, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :karmas
  end
end
