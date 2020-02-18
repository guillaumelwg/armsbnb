class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def show
    @weapon = Weapon.find(params[:id])
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
    params.require(:weapon).permit(:name, :category, :price, :localisation)
  end
end
