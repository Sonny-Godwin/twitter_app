require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  ### Run special "setup" method to create an instance variable available to all tests
  def setup
    @base_title = "Twitter Example App"
  end
  
  ## Failure Test: Check get Home Page and Page Title
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  ## Failure Test: Check get Help Page and Page Title
  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  ## Failure Test: Check get About Page and Page Title
  test "should get about" do 
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  ## Failure Test: Check get Contact Page and Page Title  
  test "should get contact" do 
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
  
end
