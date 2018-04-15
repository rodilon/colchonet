class User < ActiveRecord::Base
    EMAIL_REGEXP = /\A\S+@.+\.\S+\z/

    validates_presence_of :email, :full_name, :location, :password
    validates_confirmation_of :password
    validates_length_of :bio, minimum: 10, allow_blank: false
    validate :email_format
    validates_uniqueness_of :email
    
    private
    
    def email_format
        errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
    end
end