class AddPhotoGalleryIntro < ActiveRecord::Migration
  def self.up
    add_column :user_profiles, :photo_gallery_intro, :text
  end

  def self.down
    remove_column :user_profiles, :photo_gallery_intro
  end
end