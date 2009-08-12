class UserProfile < ActiveRecord::Base
  belongs_to :user
  
  validates_uniqueness_of :name, :message => "Nickname has already been taken"
  
  
  
  make_permalink
  
  def to_param       
    return permalink unless permalink.blank?
    name.to_url
  end
  
  named_scope :art_gallery_members, :conditions => { :is_art_gallery_member => true }#, :limit => 4
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "60x60>" },
                            :url => "/assets/avatars/:id/:style/:basename.:extension",
                            :default_url   => "/images/common/avatars/:style/missing.png",
                            :path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension"
                            
                            
  def fullname
    firstname + " " + lastname rescue ''
  end
  
end
