class User < ApplicationRecord
  attr_accessor :remember_token
  # before_create :remember

   has_secure_password


    # Returns a random token.
    def User.new_token
       SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
       self.remember_token = User.new_token
       update_attribute(:remember_digest, Digest::SHA1.hexdigest(remember_token.to_s))
    end

end
