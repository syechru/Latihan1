class ChargesController < ApplicationController

  def new

  end

  def create
    # Amount in cents
    @amount = current_order.subtotal

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => current_order.id,
      :amount      => current_order.subtotal,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
