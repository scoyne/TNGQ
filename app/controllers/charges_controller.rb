class ChargesController < ApplicationController
  
  def new
      @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "Premium Membership - #{current_user.email}",
        amount: @amount
      }
    end

    def create
      @amount = 1500 # Amount in cents
    
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

      current_user.update_attribute(:role, 'premium')

      flash[:success] = "Thank you for your membership! #{current_user.email}!"
      redirect_to root_path

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
    end
end
