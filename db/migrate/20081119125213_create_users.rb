class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :salt, :crypted_password,    :limit => 40
      t.string :name,                               :limit => 100, :default => '', :null => true
      t.string :email,                              :limit => 100

      t.string :remember_token, :activation_code,   :limit => 40

      t.datetime :created_at, :updated_at, :activated_at,
        :remember_token_expires_at, :deleted_at

      t.string :state, :null => false, :default => 'passive'
      t.boolean :admin
      t.integer :pkgs_count, :repos_count
    end
    add_index :users, :login, :unique => true
  end

  def self.down
    drop_table "users"
  end
end
