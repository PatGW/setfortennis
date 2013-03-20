class CommentsController < ApplicationController
  protect_from_forgery

  def index
    @comments = Comment.find_all_by_video_id(params[:video_id])
  end

  def new
    @video = Video.find_by_id(params[:video_id])
    @comment = @video.comments.build
  end

  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Added a new Comment"
      redirect_to player_path(@player)
    else
      redirect_to players_path(@player)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    render :edit
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    if @comment.save
      flash[:success] = "Updated Comment"
      redirect_to @comment
    else
      render :edit
    end
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    redirect_to :index unless @comment
  end
end