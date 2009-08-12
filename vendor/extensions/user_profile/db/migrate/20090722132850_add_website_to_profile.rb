class AddWebsiteToProfile < ActiveRecord::Migration
  def self.up
    add_column :user_profiles, :website, :string
  end

  def self.down
    remove_column :user_profiles, :website
  end
end