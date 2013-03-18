class CoachesController < ApplicationController
  protect_from_forgery

  def index
    @coaches = Coach.all
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.new(params[:coach])
    @coach.save!
    redirect_to root_url
  end

  def edit
    @coach = Coach.find(params[:id])
    render :edit
  end

  def update
    @coach = Coach.find(params[:id])
    @coach.update_attributes(params[:coach])
    if @coach.save
      flash[:success] = "Updated Player!"
      redirect_to @coach
    else
      render :edit
    end
  end

  def show
    @coach = Coach.find_by_id(params[:id])
  end

  def destroy
    @coach = Coach.find_by_id(params[:id])
    @coach.destroy
    redirect_to root_url
  end
end