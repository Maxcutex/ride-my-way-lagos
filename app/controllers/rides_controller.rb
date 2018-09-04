class RidesController < ApplicationController

  before_action :set_ride, only: [:show, :edit, :update, :destroy]
  before_action :set_followers, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,  only: [:new, :edit, :update, :create]

  def initialize
    super
    @pgheader = 'Ride Management'
    @breadcrumb = 'Ride Mgt'
  end

  def index
    @rides = Ride.all
  end

  def search
    search_value = params[:search_value]
    @rides = Ride.where('start_location LIKE ? or end_location LIKE ?', "%#{search_value}%", "%#{search_value}%").all
  end

  def show
  end

  def new
    @ride = Ride.new
  end

  def edit
  end

  def created_rides
    @rides = Ride.where(user_id: params[:user_id])
  end

  def subscribed_rides
    @subscribed = Followers.get_by_user_id(current_user.id).all.map do |user_enroll|
      user_enroll.ride_id if user_enroll.user_id == current_user.id
    end
    @user_rides = @subscribed.compact.map do |_id|
      Ride.find_by_id(course_id)
    end
  end 

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

  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete_ride
    respond_to do |format|
      rp = ride_params
      rp.is_completed = true
      if @ride.update(rp)
        format.html { redirect_to @ride, notice: 'Ride was successfully completed.' }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_header
    render locals: { page_header: @page_header }
  end
  def set_ride
    @ride = Ride.find(params[:id])
  end

  def set_followers
    @followers = Follower.where(ride_id: params[:id], will_ride: true)
  end

  def ride_params
    params.require(:ride).permit(
      :start_location, :end_location, :date_ride, :rider_count,
      :is_active, :is_completed, :comment, :user_id
    )
  end

  def followers_params
    params.fetch(:follower, {})
  end
end
