require 'factory_girl'

FactoryGirl.define do

  factory :manufacturer do
    sequence(:name) {|n| "Chrysler" }
    country 'United States'
  end


  factory :car do
    sequence(:model) {|n| "Forester" }
    color 'Black'
    year '1994'
    mileage 35000

    manufacturer
  end




end
