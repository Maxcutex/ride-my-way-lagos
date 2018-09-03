class RidesController < ApplicationController

  before_action :set_ride, only: [:show, :edit, :update, :destroy]
  before_action :set_followers, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,  only: [:new, :edit, :update, :create]

  def initialize
    super
    @pgheader = 'Ride Management'
    @breadcrumb = 'Ride Mgt'
  end

  # GET /rides
  # GET /rides.json
  def index
    @rides = Ride.all
  end

  def search
    search_value = params[:search_value]
    @rides = Ride.where('start_location LIKE ? or end_location LIKE ?', "%#{search_value}%", "%#{search_value}%").all
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  # POST /rides
  # POST /rides.json
  def create
    if params[:year].nil?
      date2 = DateTime.now
    else
      date2 = DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i, 0)
    end
    @ride = Ride.new(ride_params)
    @ride.date_ride = date2
    @ride.is_active = true
    @ride.is_completed = false
    @ride.rider_count = params[:rider_count]
    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: 'Ride was successfully created.' }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { render :new }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rides/1
  # PATCH/PUT /rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_header
      render locals: { page_header: @page_header }
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    def set_followers
      @followers = Follower.where(ride_id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      # params.fetch(:ride, {})
      params.require(:ride).permit(
        :start_location, :end_location, :date_ride, :rider_count,
        :is_active, :is_completed, :comment, :user_id
      )
    end

    def followers_params
      params.fetch(:follower, {})
    end
end
