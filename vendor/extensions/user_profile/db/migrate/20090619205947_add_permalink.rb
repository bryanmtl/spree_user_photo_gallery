class AddPermalink < ActiveRecord::Migration
  def self.up
    add_column :user_profiles, :permalink, :string
  end

  def self.down
    remove_column :user_profiles, :permalink
  end
end