class Submission < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :product
  
  
  has_attached_file :image, :styles => { :large => "568x650>", :thumb => "165x165#", :tiny => '75x75#' },
                            :url => "/assets/photo_gallery/:id/:style/:basename.:extension",
                            :path => ":rails_root/public/assets/photo_gallery/:id/:style/:basename.:extension"
  

  named_scope :active, :conditions => { :active => true }
  named_scope :three_gallery_images, :limit => 3
  named_scope :most_recent, :limit => 9, :order => 'id DESC'
  named_scope :three_gallery_images_for_product, lambda { |product| { :conditions => { :product_id => product }, :limit => 3, :order => 'RAND()'}}
  named_scope :three_gallery_images_for_user, lambda { |user| { :conditions => { :user_id => user }, :limit => 3, :order => 'id desc'}}
  
  
  def self.per_page
    24
  end
  
  def has_profile_info?
    !self.user.user_profile.nil?
  end
  
  
end
