class Event < ApplicationRecord
    validates :start_date, presence: true, uniqueness: true 
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :titlte, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
    validates :location, presence: true 

    belongs_to :createur, class_name: 'User' #un seul administrateur par évènement
    has_many :attendances #plusieurs participants par évènement
end
