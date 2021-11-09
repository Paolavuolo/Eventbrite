class UserMailer < ApplicationMailer
    default from: 'no-reply@eventbrite.fr'

    def welcome_email(user)
        #on récupère l'instance user pour ensuite pouvoir la passer a la view en @user
        @user=user 
        #on definit une variable @url qu'on utilisera dans la view d'e-mail
        @url = 'http://eventbrite.fr/login'
        #c'est cet appel a mail() qui permet d'envoyer l'email en définissant destinataire et sujet
        mail(to: @user.email, subject: 'Bienvenue chez nous')
    end 
    
end
