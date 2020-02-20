class BookingsController < ApplicationController
  before_action :set_weapon, only: [:create]

  def index
    @bookings = policy_scope(Booking)
    @bookings = Booking.where(user_id: current_user)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.weapon = @weapon
    authorize @weapon
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
     render :index
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end


  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to weapons_path
  end

  private
  def booking_params
    params.require(:booking).permit(:bookingdate)
  end

  def set_weapon
    @weapon = Weapon.find(params[:weapon_id])
  end
end
