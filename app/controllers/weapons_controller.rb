class WeaponsController < ApplicationController
  def index
    @weapons = policy_scope(Weapon)
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @weapons = policy_scope(Weapon)
      @weapons = Weapon.where(sql_query, query: "%#{params[:query]}%")

      @markers = @weapons.map do |weapon|
        {
          lat: weapon.latitude,
          lng: weapon.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { weapon: weapon })
        }
      end
    else
      @weapons = Weapon.geocoded

      @markers = @weapons.map do |weapon|
        {
          lat: weapon.latitude,
          lng: weapon.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { weapon: weapon })
        }
      end
    end
  end

  def show
    @weapon = Weapon.find(params[:id])
    authorize @weapon
    @booking = Booking.new
  end

  def new
    @weapon = Weapon.new
    authorize @weapon
  end

  def create
    @weapon = Weapon.new(weapon_params)
    authorize @weapon
    @weapon.user = current_user
    if @weapon.save
      redirect_to weapon_path(@weapon)
    else
      render :new
    end
  end

  def edit
    @weapon = Weapon.find(params[:id])
    authorize @weapon
  end

  def update
    @weapon = Weapon.find(params[:id])
    authorize @weapon
    @weapon.update(weapon_params)
    redirect_to weapon_path(@weapon)
  end

  def destroy
   @weapon = Weapon.find(params[:id])
   authorize @weapon
   @weapon.destroy
   redirect_to weapons_path
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :category, :price, :localisation, :photo)
  end
end
