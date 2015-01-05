class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    @manufacturers = Manufacturer.all
  end


  def create

    @manufacturer = Manufacturer.find(params[:car][:id])
    params[:car][:year] = "31-12-#{params[:car][:year]}".to_date
    params[:car][:color] = params[:car][:color].capitalize
    @car = @manufacturer.cars.build(car_params)

    if @car.save
      redirect_to cars_path, :notice => "Car successfully added"
    else
      @manufacturers = Manufacturer.all
      render :new
    end
  end

  protected

  def car_params
    params.require(:car).permit(:model, :color, :manufacturer_id,:mileage, :year)
  end

end
