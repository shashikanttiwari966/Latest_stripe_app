# if Rails.application.credentials[:stripe].present? && Rails.application.credentials[:stripe][:secret].present?
#   Stripe.api_key = Rails.application.credentials[:stripe][:secret]
# end
Rails.configuration.stripe = {
:publishable_key => 'pk_test_51HGvg5JfukXgeBIwbJZCCzihvn4r7Ri2VXGjnuJLfYlOrUjFh19eYZbAQ3yPUnvHK5c02deteBFbB9APFZG5Hke7000iIjsANn',
:secret_key => 'sk_test_51HGvg5JfukXgeBIwMkhqvEEUVA5Bp0UqQEw4WoFeO9gsmRy8VbfpfsRmwF2ENlJVmOFskHtEDimPi81iC5CEwQjS00xKUtMMXm'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
#Stripe.api_version = "2019-11-05"