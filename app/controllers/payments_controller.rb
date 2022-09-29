require 'stripe'
require 'json'
Rails.configuration.stripe = {
  pulishable_key: ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
  secrete_key: ENV['STRIPE_TEST_SECRETE_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secrete_key]

class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  # Securely calculate the order amount
  def calculate_order_amount(_plan)
    plans_prices = {
      premium: 10,
      amaze: 20
    }

    plans_prices[_plan.to_sym]
  end

  def create_intent
    plan_amount = calculate_order_amount(params.require('plan'))
    payment_intent = Stripe::PaymentIntent.create(
      amount: plan_amount * 100,
      currency: 'usd',
      automatic_payment_methods: {
        enabled: true
      }
    )
    render json: { clientSecret: payment_intent['client_secret'] }
  end
end
