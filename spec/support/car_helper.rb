module CarHelper
	def add_new_car(car)
		visit new_car_path

    select 1994, from: 'car_year'
    select manufacturer.name, from: 'car_id'

    fill_in 'Color', with: car.color
    fill_in 'Model', with: car.model
    fill_in 'Mileage', with: car.mileage

    click_button 'Submit'

	end


end