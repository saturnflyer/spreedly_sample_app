# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_spreedly_sample_app_session',
  :secret      => 'f676a4b5f8ad2a43b268cc07196186d2f914fcb04716f52a95c1b41d0dd4697b6d980b70d62f1a45a5e3b35746b6a30c4b0ca2ca86c81647bae4fd812083d647'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
