class VideosController < ApplicationController
  protect_from_forgery

  def index
    @videos = Video.find_all_by_player_id(params[:player_id])
  end

  def new
    @player = Player.find_by_id(params[:player_id])
    @video = @player.videos.build
  end

  def create
    @player = Player.find(params[:id])
    @video = @player.videos.build(params[:video])
    if @video.save
      flash[:success] = "Added a new Video"
      redirect_to player_video_path(@player, @video)
    else
      render :show
    end
  end

  def edit
    @video = Video.find(params[:id])
    render :edit
  end

  def update
    @video = Video.find(params[:id])
    @video.update_attributes(params[:video])

    if @video.save
      flash[:success] = "Updated Video"
      redirect_to @video
    else
      render :edit
    end
  end

  def show
    @video = Video.find_by_id(params[:id])
    redirect_to :index unless @video
  end
end
