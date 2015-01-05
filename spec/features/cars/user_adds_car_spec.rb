require 'rails_helper'

feature 'user adds a car', %Q{
  As a user(cars salesperson)
  I want to keep track of all cars in my lot

  [x] 1) User should be able to add or select manufacturer name
  [x] 2) Car must have a model
  [x] 3) Car must have a color
  [x] 4) Car must be unique
  [x] 5) User sees all listings of manufacturers upon correct recording information
} do


  let!(:manufacturer) { FactoryGirl.build(:manufacturer) }
  let!(:car) { FactoryGirl.build(:car) }


  scenario 'user adds a car' do

    add_new_car(car)

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content(car.model)

  end

   scenario 'User does not fill out form at all' do


    visit new_car_path
    click_button 'Submit'

    expect(page).to have_content "Model can't be blank"
    expect(page).to have_content "Mileage can't be blank"
    expect(page).to have_content "Color can't be blank"
  end

  scenario 'User does not fill out form correctly' do

    visit new_car_path
    fill_in 'Model', with: 'B'
    fill_in 'Mileage', with: 'awesome article, dude'

    fill_in 'Color', with: 'awesome article, dude'

    click_button 'Submit'

    expect(page).to have_content "Model is too short (minimum is 4 characters)"
    expect(page).to have_content "Mileage is not a number"
    expect(page).to have_content "Must be real car color"

  end

  scenario "User enters model that is too long" do


    visit new_car_path
    fill_in 'Model', with: 'Here is a model that is over 50 characters. Much too long dude! Do not be so long! You are annoying for everyone!'

    click_button 'Submit'

    expect(page).to have_content "Model is too long (maximum is 25 characters)"
  end

   scenario 'user cannot add a car that is already in the database' do
    add_new_car(car)

    add_new_car(car)

    expect(page).to_not have_content 'Car was successfully created.'
    expect(page).to have_content 'Model has already been taken'
  end


 end