class Admin::SubmissionsController < Admin::BaseController 
  
  resource_controller
  actions :show, :index, :destroy
  
  layout 'admin'
  
  private
    def collection
      @collection ||= end_of_association_chain.find(:all, :order => 'id desc')
    end
  
end
