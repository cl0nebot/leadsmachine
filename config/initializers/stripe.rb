Rails.configuration.stripe = {
  publishable_key: ENV['PUBKEY'],
  secret_key:      ENV['SECKEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
STRIPE_PUBLIC_KEY = Rails.configuration.stripe[:publishable_key]