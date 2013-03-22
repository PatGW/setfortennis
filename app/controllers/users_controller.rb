class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if params[:player_type] == "coach"
      tennis_player = Coach.create
    elsif params[:player_type] == "player"
      tennis_player = Player.create
    else
      render :new
      return
    end 
    @user.tennis_player = tennis_player
    if @user.save
      flash[:notice] = "Signed up!"
      redirect_to @user
    end
  end

  def show
    @user = User.find_by_tennis_player_id(params[:id])
    
  end
end
