class FollowersController < ApplicationController
  load_and_authorize_resource
  before_action :set_ride, only: [:new, :create]
  before_action :set_follower, only: [:show, :edit, :update, :destroy, :unsubscribe, :remove]
  before_action :authenticate_user!,  only: [:new, :edit, :update, :create]
   
  rescue_from CanCan::AccessDenied do
    if user_signed_in?
      redirect_to rides_path
    else
      redirect_to new_user_session_url
    end
  end
  def initialize
    super
    @pgheader = 'Ride Management'
    @breadcrumb = 'Ride Mgt'
  end

  def show
  end

  def new
    @follower = Follower.new
  end

  def edit
  end

  def create
    @follower = Follower.new(follower_params)
    @follower.will_ride = true
    respond_to do |format|
      if @follower.save
        format.html { 
          redirect_to ride_path(id: @ride.id),
          notice: 'You have successfully subscribed to the ride.'
        }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { redirect_to new_ride_path }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @follower.update(follower_params)
        format.html {
          redirect_to ride_path(id: @ride.id),
            notice: 'You have successfully updated your position on the ride.'
        }
        format.json {
          render :show, status: :ok, location: ride_path(id: @ride.id)
        }
      else
        format.html { render :edit }
        format.json {
          render json: @follower.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def remove
    respond_to do |format|
      if @follower.nil?
        format.html { redirect_to ride_path(id: @ride.id), notice: 'No record of your subscription could be found.' }
        format.json { head :no_content }
      else
        if @follower.update(follower_params)
          format.html { redirect_to ride_path(id: @ride.id) , notice: 'You have successfully unsubscribed from the ride.' }
          format.json { render :show, status: :ok, location: ride_path(id: @ride.id) }
        else
          format.html { redirect_to unsubscribe_path(id: @follower.id, ride_id: @ride.id), notice: 'Failure to unsubscribed from the ride.' }
          format.json { render json: @follower.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @follower.destroy
    respond_to do |format|
      format.html { redirect_to ride_path(id: @ride.id), notice: 'You have successfully unsubscribed from the ride.' }
      format.json { head :no_content }
    end
  end

  def unsubscribe
    if @follower.nil?
      respond_to do |format|
        byebug
        format.html { redirect_to ride_path(id: @ride.id), notice: 'No record of your subscription could be found.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_follower
    @follower = Follower.get_by_id_ride_id(params[:id], params[:ride_id])
    @ride = Ride.find_by_id(params[:ride_id])
  end

  def set_ride
    @ride = Ride.find_by_id(params[:ride_id])
  end

  def follower_params
    params.require(:follower).permit(
      :ride_id, :will_ride, :user_id, :pick_up_location, :id
    )
  end

end
