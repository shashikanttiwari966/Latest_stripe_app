# if Rails.application.credentials[:stripe].present? && Rails.application.credentials[:stripe][:secret].present?
#   Stripe.api_key = Rails.application.credentials[:stripe][:secret]
# end
Rails.configuration.stripe = {
:publishable_key => 'pk_test_51HGvg5JfukXgeBIw9XtmMTlNsU3wlgzzhFGjqgA4nmq089GESYj9H62Abgu09J4uk4iL8s5P7P7lKr0DOfjEqWg700d3jOd5UI',
:secret_key => 'sk_test_51HGvg5JfukXgeBIwrFjnfMg1lUBJExxdIMkjV5yejEctjegORxkGdbom42mLeEaLBj7gpuIQDryZaqHFvTMiBdZH00qzmNhwtx'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
#Stripe.api_version = "2019-11-05"