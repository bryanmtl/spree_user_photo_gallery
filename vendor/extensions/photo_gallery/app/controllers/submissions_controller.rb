class SubmissionsController < ApplicationController
  # require 'jrails'
  helper 'spree/base'
  resource_controller
  actions :new, :create, :destroy
  
  before_filter :require_user, :only => [:new, :create]
  before_filter :get_product_or_user
  
  
  destroy do
    success.wants.html do
      redirect_to(admin_submissions_url)
     end
    success.wants.js do
      render :template => 'submissions/destroy'
    end
  end
  
  def index
    
      # show all or show filtered
    begin
      if params[:user_profile_id]
        #@submissions = UserProfile.find_by_permalink(params[:user_profile_id]).user.submissions
        @submissions = Submission.paginate(:include => :user, :page => params[:page], :conditions => ['submissions.user_id = ?', UserProfile.find_by_permalink(params[:user_profile_id]).user_id], :order => 'id desc')
        @filter = 'user'
      elsif params[:product_id]
        #@submissions = Product.find_by_permalink(params[:product_id]).submissions
        @submissions = Submission.paginate(:include => :user, :page => params[:page], :conditions => ['submissions.product_id = ?', Product.find_by_permalink(params[:product_id]).id], :order => 'id desc')
        @filter = 'product'
      else
        @submissions = Submission.paginate(:page => params[:page], :order => 'id desc')
        @filter = 'none'
      end
    rescue
      @submissions = Submission.paginate(:page => params[:page], :order => 'id desc')
      @filter = 'none'
    end
    #@posts = Post.paginate_by_board_id @board.id, :page => params[:page], :order => 'updated_at DESC'
  end
  
  def show
    @submission = Submission.find(params[:id])
    
    if params[:user_profile_id]
      @filter = 'user'
      conditions = ['user_id = ?', @submission.user_id]
    elsif params[:product_id]
      conditions = ['product_id = ?', @submission.product_id]
      @filter = 'product'
    else
      @filter = 'none'
      conditions = []
    end
    
    @submissions = Submission.find(:all, :conditions => conditions)
    
  
  end
  
  protected 
  
  def get_product_or_user
    @product = Product.find_by_permalink(params[:product_id]) if params[:product_id]
    @user_profile = UserProfile.find_by_permalink(params[:user_profile_id]) if params[:user_profile_id]
  end

  
  
  
end
