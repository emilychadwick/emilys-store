class PaymentsController < ApplicationController

  def create

    @product = Product.find(param[:product_id])
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_registration_page
    end

    token = params[:stripeToken]
    # create the charge on Stripe's servers to charge user card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100).to_i, #amount in cents
        currency: "usd",
        source: token,
        description: params[:stripeEmail],
        receipt_email: "example@fake.com"
      )

      if charge.paid
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
          )
        flash[:success] = "Your payment was processed successfully"
      end

    rescue Stripe::CardError => e
      # the card has been declined
      body = e.jason_body
      err = body[:error]
      flash[:error] = "Unforunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product)
    end
  end

end
