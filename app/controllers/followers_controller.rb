class FollowersController < ApplicationController
  before_action :set_follower, only: [:show, :edit, :update, :destroy, :unsubscribe]
  before_action :set_ride, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!,  only: [:new, :edit, :update, :create]


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
    
    rider_cannot_follow('create')
    @follower = Follower.new(follower_params)
     
    @follower.will_ride = true
    respond_to do |format|
      if @follower.save
        format.html { redirect_to ride_path(id: @ride.id), notice: 'You have successfully subscribed to the ride.' }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { redirect_to new_ride_path }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /followers/1
  # PATCH/PUT /followers/1.json
  def update
    rider_cannot_follow('update')
    respond_to do |format|
      if @follower.update(follower_params)
        format.html { redirect_to ride_path(id: @ride.id) , notice: 'You have successfully updated your position on the ride..' }
        format.json { render :show, status: :ok, location: ride_path(id: @ride.id) }
      else
        format.html { render :edit }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followers/1
  # DELETE /followers/1.json
  def destroy
    @follower.destroy
    respond_to do |format|
      format.html { redirect_to ride_path(id: @ride.id), notice: 'You have successfully unsubscribed from the ride.' }
      format.json { head :no_content }
    end
  end

  def unsubscribe
    
    respond_to do |format|
      #@follower.will_ride = false
      if @follower.update(will_ride: false)
        format.html { redirect_to ride_path(id: @ride.id), notice: 'You have successfully unsubscribed from this ride.' }
        format.json { render :show, status: :ok, location: ride_path }
      else
        format.html { render :edit }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end 

  private

  def set_follower
    @follower = Follower.get_by_id_ride_id(params[:id], params[:ride_id])
  end

  def set_ride
    @ride = Ride.find_by_id(params[:ride_id])
  end

  def follower_params
    #params.fetch(:follower, {})
    params.require(:follower).permit(
      :ride_id, :will_ride, :user_id, :pick_up_location, :id
    )
    
  end

  def rider_cannot_follow(action)
    
    if action == 'create'
      path = new_ride_follower_path(@ride.id)
    else
      path = edit_ride_follower_path(@ride.id)
    end
    
    if current_user.id == @ride.user_id
      format.html { redirect_to path, notice: 'You cannot subscribe to a ride you created' }
    end
  end
end
