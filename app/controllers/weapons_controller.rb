class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
    @weapons = Weapon.geocoded # returns flats with coordinates
     @weapons = Weapon.geocoded

    @markers = @weapons.map do |weapon|
      {
        lat: weapon.latitude,
        lng: weapon.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { weapon: weapon })
      }
    end
  end

  def show
    @weapon = Weapon.find(params[:id])
    @booking = Booking.new

  end

  def new
    @weapon = Weapon.new
  end

  def create
    @weapon = Weapon.new(weapon_params)
    @weapon.user = current_user
    if @weapon.save
      redirect_to weapon_path(@weapon)
    else
      render :new
    end
  end

  def edit
    @weapon = Weapon.find(params[:id])
  end

  def update
    @weapon = Weapon.find(params[:id])
    @weapon.update(weapon_params)
    redirect_to weapon_path(@weapon)
  end

  def destroy
   @weapon = Weapon.find(params[:id])
   @weapon.destroy
   redirect_to weapons_path
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :category, :price, :localisation, :photo)
  end
end
