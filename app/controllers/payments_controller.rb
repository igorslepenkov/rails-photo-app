class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def create_intent
    payment_intent = StripeServices::PaymentIntent.new(params).create
    render json: { clientSecret: payment_intent['client_secret'] }
  end
end
