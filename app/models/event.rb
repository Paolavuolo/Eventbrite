class Event < ApplicationRecord
    validates :start_date, presence :true, uniqueness: true 
    validates :duration, presence :true
    validates :title, presence :true
    validates :description, presence :true
    validates :price, presence :true
    validates :location, presence :true 
end
