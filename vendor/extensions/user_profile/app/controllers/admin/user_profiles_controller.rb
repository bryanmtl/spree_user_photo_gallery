class Admin::UserProfilesController < Admin::BaseController    
    resource_controller
    layout 'admin'
    
    def update
      @user_profile = UserProfile.find_by_permalink(params[:id])

      respond_to do |format|
        if @user_profile.update_attributes(params[:user_profile])
          flash[:notice] = 'User was successfully updated.'
          format.html { redirect_to(admin_user_profiles_url) }
        else
          format.html { render :action => "edit" }
        end
      end
    end
    
end