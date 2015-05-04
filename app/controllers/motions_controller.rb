class MotionsController < ApplicationController
  before_action :set_motion, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def remote_motion
    @motion = Motion.create(:lock_id=>params[:lock_id])
    redirect_to action: "index"
  end

  def index
    @motions = Motion.all
    respond_with(@motions)
  end

  def show
    respond_with(@motion)
  end

  def new
    @motion = Motion.new
    respond_with(@motion)
  end

  def edit
  end

  def create
    @motion = Motion.new(motion_params)
    @motion.save
    respond_with(@motion)
  end

  def update
    @motion.update(motion_params)
    respond_with(@motion)
  end

  def destroy
    @motion.destroy
    respond_with(@motion)
  end

  private
    def set_motion
      @motion = Motion.find(params[:id])
    end

    def motion_params
      params.require(:motion).permit(:lock_id)
    end
end
