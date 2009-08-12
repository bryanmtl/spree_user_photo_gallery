# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PhotoGalleryExtension < Spree::Extension
  version "1.0"
  description "Adds a photo gallery to your site that allows users to upload pictures of the product(s) they purchased"
  url "http://github.com/bryanmtl/photo_gallery"

  
  
  def activate
    
    # Admin::BaseController.class_eval do
    #       before_filter :add_photo_gallery_tab
    #       
    #       def add_photo_gallery_tab
    #         add_extension_admin_tab [ :submissions, { :label => 'photo_gallery' } ]
    #       end
    #     end
    
    
    Product.class_eval do
      has_many :submissions, :conditions => { :active => true }
    end
    
    User.class_eval do
      has_many :submissions, :conditions => { :active => true }, :order => 'id DESC'
      
      def recent_uploads
        submissions.find(:all, :conditions => { :active => true }, :limit => 9, :order => 'id DESC')
      end
      
      def self.popular_peeps
        User.find(:all, :select => 'users.*, count(submissions.user_id) AS total_images', 
                  :joins => :submissions, :include => :user_profile,
                  :limit => 6, :group => 'submissions.user_id', :order => 'total_images DESC')
        
      end

    end
    
    
  end
  
  
end