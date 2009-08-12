class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.string :name
      t.string :blurb
      t.string :hometown
      t.datetime :birthday
      t.string :favorite_band
      t.string :favorite_song
      t.text :save_the_world_plan
      t.boolean :active, :default => true
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.datetime :avatar_updated_at
      t.integer :avatar_file_size, :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
