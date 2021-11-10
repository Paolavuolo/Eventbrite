# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#commande pour réinitialiser les id
Event.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('events')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')

10.times do
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movies::Hobbit.quote, password: '123456')
    user.email = user.first_name + '.' + user.last_name + '@hotmail.com'
    user.save
  end
  
  puts '10 users créés'
  
  7.times do
    Event.create(titlte: Faker::JapaneseMedia::OnePiece.akuma_no_mi, start_date: Faker::Date.forward(days: 10), duration: [5,10,20,30].sample, description: Faker::Lorem.sentence(word_count: 15), price: Faker::Number.between(from: 1, to: 1000), location: Faker::JapaneseMedia::OnePiece.location)
  end

  puts '7 events créés'
  
