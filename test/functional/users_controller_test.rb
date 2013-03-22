require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def test_user_can_be_created
    assert_equal 0, User.count
    # send a request to the controller
    post :create, {:user => {:email => "patrick@gmail.com", :password => "password"}, :player_type => "coach"}
    # make sure a user gets created
    assert_equal 1, User.count
    assert_redirected_to user_url(User.first)
    assert_equal "Signed up!", flash[:notice]
  end

  def test_a_coach_is_created_if_necessary
    assert_equal 0, Coach.count
    post :create, {:user => {:email => "patrick@gmail.com", :password => "password"}, :player_type => "coach"}
    assert_equal 1, Coach.count
    assert_equal 0, Player.count
  end

  # another test that a player is created if necessary

  def test_a_player_is_created_if_necessary
    assert_equal 0, Player.count
    post :create, {:user => {:email => "patrick@gmail.com", :password => "password"}, :player_type => "player"}
    assert_equal 1, Player.count
    assert_equal 0, Coach.count
  end

  # another that that an error is thrown or a redirect happens or smth else if the player type is not given at all

   def test_an_error_is_thrown_or_redirect_happens_if_player_type_is_missing
    assert_equal 0, Player.count
    post :create, {:user => {:email => "patrick@gmail.com", :password => "password"}, :player_type => ""}
    assert_template :new
    assert_equal 0, Player.count
  end

  # test to check that after user has signed up they are redirected to their show page

  def test_once_user_is_signed_up_they_are_redirected_to_their_profile_page
    post :create, {:user => {:email => "patrick@gmail.com", :password => "password"}, :player_type => "player"}
    assert_redirected_to user_path(:user) 
  end

end
