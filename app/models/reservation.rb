class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :number_of_people, presence: true
  validates :check_in_day, presence: true
  validates :check_out_day, presence: true
end
