Rails.configuration.stripe = {
  pulishable_key: ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
  secrete_key: ENV['STRIPE_TEST_SECRETE_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secrete_key]
