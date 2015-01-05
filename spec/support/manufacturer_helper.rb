module ManufacturerHelper
	def add_new_manufacturer(manufacturer)
		visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    select 'United States', from: 'country'

    click_button 'Submit'
	end


end