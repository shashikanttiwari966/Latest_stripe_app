# if Rails.application.credentials[:stripe].present? && Rails.application.credentials[:stripe][:secret].present?
#   Stripe.api_key = Rails.application.credentials[:stripe][:secret]
# end
Rails.configuration.stripe = {
:publishable_key => 'pk_test_51JNaUlSBn2OWJA3i33NonRjjffhtJUwLbgtsiovIrt3mwmhCHMuTaof9cwNaHqTadXoimXjBTM8Tj0eSrSf5A1tl00y6TFkeGQ',
:secret_key => 'sk_test_51JNaUlSBn2OWJA3igYXVF62Ts0MPHiCtF6DnPm6sd5GDf1xQ4PnuFAOysZlBqlzEA1WV8Vbnp2IuXXXz5MbQRASa00NfEqWiFF'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
#Stripe.api_version = "2019-11-05"