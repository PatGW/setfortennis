require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def test_user_can_be_created
    assert_equal 0, User.count
    # send a request to the controller
    post :create, {:user => {:email => "patrick@gmail.com", :password => "password"}}
    # make sure a user gets created
    assert_equal 1, User.count
    assert_redirected_to root_url
    assert_equal "Signed up!", flash[:notice]
  end

  def test_a_coach_is_created_if_necessary
    assert_equal 0, Coach.count
    post :create, {:user => {:email => "patrick@gmail.com", :password => "password"}, :player_type => "coach"}
    assert_equal 1, Coach.count
    assert_equal 0, Player.count
  end

  # another test that a player is created if necessary

  # another that that an error is thrown or a redirect happens or smth else if the player type is not given at all

end
