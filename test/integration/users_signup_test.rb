require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  ## Test: Enter invalid information and check to see if user was added to database
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {name: " ", email: "user@invalid.com", password: "foo", password_confirmation: "bar"}
    end
    assert_template "users/new"
  end

  ## Test: Enter valid informaiton and check to see if user was added to database
  test "valid signup information" do
    get signup_path
    assert_diffference 'User.count', 1 do
      post_via_redirect users_path,  user: { name: "Example User", email: "user@example.com", password: "password", password_confirmation: "password" }
    end
    assert_template "users/show"
  end

end
