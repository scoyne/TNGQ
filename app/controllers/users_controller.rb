class UsersController < ApplicationController
    def downgrade
        current_user.update_attribute(:role, 'standard')

        if current_user.save
          flash[:notice] = "You have successfully cancelled your Premium Membership."
          redirect_to root_path
        else
          flash[:alert] = "There was a problem cancelling your account.  Please try again."
          redirect_to root_path
        end
    end
end