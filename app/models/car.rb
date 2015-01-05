class Car < ActiveRecord::Base

  belongs_to :manufacturer

  start_year_range = Time.now.year - 95
  end_year_range = Time.now.year

  year_range = (start_year_range..end_year_range).map{|year| "31-12-#{year}".to_date}

  validates :year, presence: true, inclusion: {:in => year_range}

  validates :color, presence: true, inclusion: {within: ['Black', 'Blue', 'Silver', 'Gold',
    'Green','Dark Gray','Gray','Red','Yellow', 'White','Rust','Orange','Lime Green','Beige',
    'Brown','Metallic Gray'], message: "Must be real car color"}
  validates :model, presence: true,
  length: {
  minimum: 4,
  maximum: 25
  }
  validates :mileage, presence: true, numericality: true
  validates :description, length: { maximum: 500 }
  validates_uniqueness_of :model, scope: [:color, :mileage, :year]
end
