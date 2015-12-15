class User < ActiveRecord::Base
    
    ## Callback method to save emails to all lowercase
    before_save { self.email = email.downcase }
    
    ## Validate if name attribute is nonblank and has maximum length of 50 characters
    validates :name, presence: true, length: {maximum: 50}
    
    ## Validate if email attribute is nonblank, has a maximum length of 255 characters, and uses regex to check email validation
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
    
    ## Has Secure Password and is nonblank and minimum length of 6
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
end


