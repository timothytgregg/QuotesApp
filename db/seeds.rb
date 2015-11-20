# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Quote.destroy_all
Author.destroy_all
Collection.destroy_all
Favorite.destroy_all

phil=Collection.create(title:"Philosophy")
goofy=Collection.create(title:"Goofiness")
billboards=Collection.create(title:"Billboards")

fn = Author.create(name:"Friedrich Nietzsche")
q1=fn.quotes.create(content:"Those who were dancing were thought insane by those who could not hear the music.")
q2=fn.quotes.create(content:"It takes a bit of chaos in oneself to give birth to a dancing star.")

ac = Author.create(name:"Albert Camus", full_name:nil, birthyear:nil, deathyear:nil)
q3=ac.quotes.create(content:"Au milieu de l'hiver, j'apprenais enfin qu'il y avait en moi un été invincible.")
q4=ac.quotes.create(content:"Life should be lived to the point of tears.")

ase = Author.create(name:"Antoine de Saint-Éxupery", full_name:nil, birthyear:nil, deathyear:nil)
q5=ase.quotes.create(content:"Perfection is reached not when there is nothing more to add, but when there is nothing more to subtract.")

taytay = Author.create(name:"Taylor Swift", full_name:nil, birthyear:nil, deathyear:nil)
q6=taytay.quotes.create(content:"Romeo, Take Me Somewhere We Can Be Alone.")

Favorite.create(quote_id:q1.id, collection_id:phil.id)
Favorite.create(quote_id:q6.id, collection_id:goofy.id)
