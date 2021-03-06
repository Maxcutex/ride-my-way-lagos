# frozen_string_literal: true

# controller for rides
class RidesController < ApplicationController
  load_and_authorize_resource
  before_action :set_ride, only: [:show, :edit, :update, :destroy, :complete_ride]
  before_action :set_followers, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! # ,  only: [:new,:index, :edit, :update, :create]

  rescue_from CanCan::AccessDenied do
    if user_signed_in?
      redirect_to action: :index
    else
      redirect_to new_user_session_url
    end
  end

  def initialize
    super
    @pgheader = 'Ride Management'
    @breadcrumb = 'Ride Mgt'
  end

  def index
    @rides = Ride.active_rides
  end

  def search
    @rides = Ride.search_by(params[:search_value], params[:option])
  end

  def show; end

  def new
    @ride = Ride.new
  end

  def find; end

  def edit; end

  def created_rides
    @rides = Ride.created_by(params[:user_id])
  end

  def subscribed_rides
    @rides = Ride.subscribed_by(params[:user_id])
  end

  def create
    if params['date[year]'].nil?
      date2 = DateTime.now
    else
      date2 = DateTime.new(
        params['date[year]'].to_i, params['date[month]'].to_i,
        params['date[day]'].to_i, params[:hour].to_i, params[:minute].to_i, 0
      )
    end
    @ride = Ride.new(ride_params)
    @ride.date_ride = date2
    @ride.is_active = true
    @ride.is_completed = false
    @ride.user_id = current_user.id
    respond_to do |format|
      if @ride.save
        format.html do
          redirect_to @ride, notice: 'Ride was successfully created.'
        end
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
        format.html do
          redirect_to @ride, notice: 'Ride was successfully updated.'
        end
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
      
      if @ride.update(is_completed: true, is_active: false)
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
    @followers = Follower.get_by_ride_id(params[:id])
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
