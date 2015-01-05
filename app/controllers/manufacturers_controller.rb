class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end
  def new
    @countries = Country.all
    @manufacturer = Manufacturer.new
  end

  def create

    params[:manufacturer][:country] = params[:country]

    @manufacturer = Manufacturer.create(manufacturer_params)

    if @manufacturer.save
      redirect_to manufacturers_path, :notice => "Manufacturer successfully added"
    else
      @countries = Country.all
      render :new
    end
  end

  protected

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :description, :country)
  end

end
