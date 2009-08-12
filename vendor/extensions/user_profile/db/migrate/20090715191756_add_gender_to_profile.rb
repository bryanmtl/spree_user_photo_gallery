class AddGenderToProfile < ActiveRecord::Migration
  def self.up
    add_column :user_profiles, :gender, :string
    add_column :user_profiles, :firstname, :string
    add_column :user_profiles, :lastname, :string
  end

  def self.down
    remove_column :user_profiles, :lastname
    remove_column :user_profiles, :firstname
    remove_column :user_profiles, :gender
  end
end