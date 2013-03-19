class PlayersController < ApplicationController
  protect_from_forgery

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(params[:player])
    @player.save!
    redirect_to root_url
  end

  def edit
    @player = Player.find(params[:id])
    render :edit
  end

  def update
    @player = Player.find(params[:id])
    @player.update_attributes(params[:player])
    if @player.save
      flash[:success] = "Updated Player!"
      redirect_to @player
    else
      render :edit
    end
  end

  def show
    @player = Player.find_by_id(params[:id])
    @videos = @player.videos
  end

  def destroy
    @player = Player.find_by_id(params[:id])
    @player.destroy
    redirect_to root_url
  end
end
