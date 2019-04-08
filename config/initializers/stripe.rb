PUBLISHABLE_KEY = "pk_test_emJazEMTwAO88gfp5NHGTS6h005WHYHCtb"
SECRET_KEY = "sk_test_XbplP0syFKEAS1udqRnSIMbK00a3P65oF1"
Rails.configuration.stripe = {
  publishable_key:  PUBLISHABLE_KEY,
  secret_key: SECRET_KEY
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]