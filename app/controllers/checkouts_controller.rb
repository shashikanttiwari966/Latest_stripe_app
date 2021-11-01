class CheckoutsController < ApplicationController
	def create
    product = Product.find(params[:id])
    @session = Stripe::Checkout::Session.create({
    customer: current_user.stripe_customer_id,
    payment_method_types: ['card'],
    line_items: [{
    name: product.name,
    amount: product.price,
    currency: "usd",
    quantity: 1
      }],
    mode: 'payment',
    success_url: root_url,
    cancel_url: root_url,
    })
    respond_to do |format|
      format.js
    end
  end


  def success
    if params[:session_id].present? 
      # session.delete(:cart)
      session[:cart] = [] # empty cart = empty array
      @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ["line_items"]})
      @session_with_expand.line_items.data.each do |line_item|
        product = Product.find_by(stripe_product_id: line_item.price.product)
      end
    else
      redirect_to cancel_url, alert: "No info to display"
    end
  end

  def cancel
  end


end
