# if Rails.env == "production"
#   Rails.application.config.session_store :cookie_store, key: "_dscore_app", domain: "dscore-api.herokuapp.com"
# else
  Rails.application.config.session_store :cookie_store, key: "_dscore_app"
# end