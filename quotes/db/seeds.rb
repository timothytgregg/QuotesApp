# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Quote.destroy_all
Author.destroy_all

fn = Author.create(name:"Friedrich Nietzsche")
fn.quotes.create(content:"Those who were dancing were thought insane by those who could not hear the music.")

ac = Author.create(name:"Albert Camus", full_name:nil, birthyear:nil, deathyear:nil)
ac.quotes.create(content:"Au milieu de l'hiver, j'apprenais enfin qu'il y avait en moi un été invincible.")
