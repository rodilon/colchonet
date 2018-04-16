class User < ActiveRecord::Base
    EMAIL_REGEXP = /\A\S+@.+\.\S+\z/

    validates_presence_of :email, :full_name, :location, :password
    validates_confirmation_of :password
    validates_length_of :bio, minimum: 10, allow_blank: false
    validates_format_of :email, with: EMAIL_REGEXP
    validates_uniqueness_of :email

    has_secure_password

end