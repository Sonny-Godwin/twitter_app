require 'test_helper'

class UserTest < ActiveSupport::TestCase

  ### Run special "setup" method to create an instance variable available to all tests
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end
  
  
  ### User Object Validity   
    ## Failure Test: Check if user is valid object
    test "should be valid" do
      assert @user.valid?
    end
  
    ## Failure Test: Name Attribute is Blank
    test "name should be present" do
      @user.name = "   "
      assert_not @user.valid?
    end
    
    ## Failure Test: Email Attribute is Blank
    test "email should be present" do
      @user.email = "    "
      assert_not @user.valid?
    end
  
  
  
  ### User Object Length   
    ## Failure Test: Name Attribute is greater than 50 characters
    test "name should not be too long" do
      @user.name = "a" * 51
      assert_not @user.valid?
    end
    
    ## Failure Test: Email Attribute is greater than 255 characters
    test "email should not be too long" do
      @user.email = "a" * 244 + "@example.com"
      assert_not @user.valid?
    end
  
  
  
  ### User Email Validation and Uniqueness  
    ## Failure Test: Set array of bad Regex emails
    test "email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        assert @user.valid?, "#{valid_address.inspect} should be valid"
      end
    end
    
    ## Failure Test: Duplicate user email, make all uppercase
    test "email addresses should be unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      assert_not duplicate_user.valid?
    end
    
    
    
  ### Password Validation and Min Length  
    ## Failure Test: Password is blank
    test "password should be present (nonblank)" do
      @user.password = @user.password_confirmation = " " * 6
      assert_not @user.valid?
    end

    ##Failure Test: Password is below minimum length of 6
    test "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?
    end

end
