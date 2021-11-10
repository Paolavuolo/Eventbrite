class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id) #on affiche le profil de la personne connectée défini par le current user
    @event_createur = Event.all #on montre tout les eévènements crée par l'utilisateur
  end
end
