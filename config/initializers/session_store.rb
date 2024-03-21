if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_capstone-module-back-end", domain: "jdg-capstone-module-back-end-api.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_capstone-module-back-end"
end