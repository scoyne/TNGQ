class ChargesController < ApplicationController
  after_action :premium_role

  def new
      @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "Premium Membership - #{current_user.email}",
        amount: @amount
      }
    end

    def create
      # Amount in cents
      @amount = 1500
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Premium Membership',
        :currency    => 'usd'
      )
      
      flash[:success] = "Thank you for your membership! #{current_user.email}!"
      redirect_to root_path

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
    end



    private
    def premium_role
        current_user.update_attribute(:role, 'premium')
        current_user.save
    end
end
