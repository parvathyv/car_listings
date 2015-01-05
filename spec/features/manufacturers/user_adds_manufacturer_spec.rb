require 'rails_helper'

feature 'user adds a manufacturer', %Q{
  As a user(cars salesperson)
  I want to keep track of all cars in my lot

  [x] 1) User should be able to add manufacturer name
  [x] 2) Manufacturer must have a name (between 5-50)
  [x] 3) Manufacturer must have a country (is valid)
  [x] 4) Manufacturer name must be unique
  [x]  5) User sees all listings of manufacturers upon correct recording information
} do


  let!(:manufacturer) { FactoryGirl.build(:manufacturer) }

  scenario 'user adds a manufacturer' do

    add_new_manufacturer(manufacturer)

    expect(page).to have_content('Manufacturer successfully added')
    expect(page).to have_content(manufacturer.name)

  end

  scenario 'User does not fill out form at all' do


    visit new_manufacturer_path
    click_button 'Submit'

    expect(page).to have_content "Name can't be blank"
    expect(page).to_not have_content "Country can't be blank"

  end

  scenario 'User does not fill out form correctly' do
    visit new_manufacturer_path
    fill_in 'Name', with: 'B'
    fill_in 'Description', with: "
but for now, I think that these are the most salient points from my rereading of IT.  I am super glad that it wasn't nearly as scary as the first time around, although I am still not quite ready to tackle the mini-series.  I did really enjoy this commentary on the book and recommend for more consideration of it: http://www.tor.com/blogs/2013/09/the-great-stephen-king-reread-it'
but for now, I think that these are the most salient points from my rereading of IT.  I am super glad that it wasn't nearly as scary as the first time around, although I am still not quite ready to tackle the mini-series.  I did really enjoy this commentary on the book and recommend for more consideration of it: http://www.tor.com/blogs/2013/09/the-great-stephen-king-reread-it'"


    click_button 'Submit'

    expect(page).to have_content "Name is too short (minimum is 2 characters)"
    expect(page).to have_content "Description is too long (maximum is 500 characters)"
  end

scenario "User enters manufacturer name that is too long" do


  visit new_manufacturer_path
  fill_in 'Name', with: 'Here is a name that is over 50 characters. Much too long dude! Do not be so long! You are annoying for everyone!'

  click_button 'Submit'

  expect(page).to have_content "Name is too long (maximum is 25 characters)"
  end

 scenario 'user cannot add a manufacturer that is already in the database' do


    add_new_manufacturer(manufacturer)

    add_new_manufacturer(manufacturer)

    expect(page).to_not have_content 'Manufacturer was successfully created.'
    expect(page).to have_content 'Name has already been taken'
  end


end
