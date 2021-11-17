class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #callback qui permet d'envoyer un mail juste après l'inscritpion 
  after_create :welcome_send 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :createurs, foreign_key:'createur_id', class_name: 'Event'
  has_many :attendances
  has_many :events, through: :attendances
         
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
