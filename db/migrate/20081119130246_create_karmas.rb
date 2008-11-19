class CreateKarmas < ActiveRecord::Migration
  def self.up
    create_table :karmas do |t|
      t.references :pkg
      t.integer :value
      t.references :user
      t.references :version

      t.timestamps
    end
  end

  def self.down
    drop_table :karmas
  end
end
