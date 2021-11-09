class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #callback qui permet d'envoyer un mail juste après l'inscritpion 
  after_create :welcome_send 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
end
