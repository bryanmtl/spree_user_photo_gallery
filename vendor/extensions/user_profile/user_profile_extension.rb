# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class UserProfileExtension < Spree::Extension
  version "1.0"
  description "A simple extension to add profile information to users"
  url "http://github.com/bryanmtl/user_profile"

  
  
  
  
  # UsersController.class_eval do
  #         before_filter :add_profile_fields
  #         def add_profile_fields
  #           @extension_partials << 'profile_fields'
  #         end
  #       end
  
  def activate
    
    User.class_eval do
      has_one :user_profile
      accepts_nested_attributes_for :user_profile
      attr_accessible :user_profile_attributes
    end
    
    # Admin::BaseController.class_eval do
    #       before_filter :add_user_profile_tab
    #       
    #       def add_user_profile_tab
    #         add_extension_admin_tab [ :user_profiles ]
    #       end
    #     end
    
    
  end
end