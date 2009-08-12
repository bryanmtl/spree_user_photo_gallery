class AddBlurb < ActiveRecord::Migration
  def self.up
    add_column :submissions, :blurb, :text
  end

  def self.down
    remove_column :submissions, :blurb
  end
end