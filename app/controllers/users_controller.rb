class UsersController < ApplicationController
    
  def downgrade
    @wikis = current_user.wikis
    @wikis.unscoped.update_all(private: 'false')
    current_user.update_attribute(:role, 'standard')   
    if current_user.save
      flash.now[:alert] = "You have successfully cancelled your Premium Membership." 
      redirect_to root_path
    else
      flash[:alert] = "There was a problem cancelling your account.  Please try again."        
      redirect_to root_path
    end
  end
#
  def show
    @user = User.find(params[:id])
  end
end