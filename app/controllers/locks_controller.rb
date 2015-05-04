class LocksController < ApplicationController
  skip_before_action :authenticate_user!, only: :get_phone
  before_action :set_lock, only: [:show, :edit, :update, :destroy]

  # GET /locks
  # GET /locks.json
  def index
    if current_user
      @locks = Lock.where("user_id="+current_user.id.to_s)
    else
      @locks = Lock.all
    end
  end

  def get_phone
    if params[:lock_id] == "0"
      render :text => "+989357672941", :layout => false
      return
    end
    @lock = Lock.where(:id => params[:lock_id]).first
    if @lock == nil
          render :text => "", :layout => false
          return
    end
    @user = User.where(:id => @lock.user_id).first
    if @user == nil
          render :text => "", :layout => false
          return
    end
    #Lock.joins(:store => :retailer).where(stores: {retailer: {id: 2}})
    render :text => @user.phone, :layout => false
   end

  # GET /locks/1
  # GET /locks/1.json
  def show
  end

  # GET /locks/new
  def new
    @lock = Lock.new
  end

  # GET /locks/1/edit
  def edit
  end

  # POST /locks
  # POST /locks.json
  def create
    @lock = Lock.new(lock_params)
    if current_user
      @lock.user_id = current_user.id
    else
      @lock.user_id = 0
    end

    respond_to do |format|
      if @lock.save
        format.html { redirect_to @lock, notice: 'Lock was successfully created.' }
        format.json { render :show, status: :created, location: @lock }
      else
        format.html { render :new }
        format.json { render json: @lock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locks/1
  # PATCH/PUT /locks/1.json
  def update
    respond_to do |format|
      if @lock.update(lock_params)
        format.html { redirect_to @lock, notice: 'Lock was successfully updated.' }
        format.json { render :show, status: :ok, location: @lock }
      else
        format.html { render :edit }
        format.json { render json: @lock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locks/1
  # DELETE /locks/1.json
  def destroy
    @lock.destroy
    respond_to do |format|
      format.html { redirect_to locks_url, notice: 'Lock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lock
      @lock = Lock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lock_params
      params.require(:lock).permit(:name, :state)
    end
end
