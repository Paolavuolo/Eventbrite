class OrdersController < ApplicationController
  def new
  end
  #création d'un client stripe avec plusieurs paramètres dont l'email et le striptoken
  def create
    # Before the rescue, at the beginning of the method
    @stripe_amount = 500
   begin 
     #client avec les informations    
     customer = Stripe::Customer.create({
     email: params[:stripeEmail],
     source: params[:stripeToken],
     })    
     charge = Stripe::Charge.create({
     customer: customer.id,
     amount: @stripe_amount, #représente le montant de la transaction en centimes
     description: "Achat d'un produit", #déscription associée a la transaction
     currency: 'eur', #monnaie utilisées dans la transaction
     })  
     rescue Stripe::CardError => e #cas d'échec du paiement 
       flash[:error] = e.message
       redirect_to new_order_path
      end# After the rescue, if the payment succeeded
  end
end
