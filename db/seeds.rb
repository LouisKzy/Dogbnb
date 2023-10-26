# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Require Faker
require 'faker'

# Créez des villes avec Faker
5.times do
  City.create(city_name: Faker::Address.city)
end

# Créez des promeneurs (dogsitters) avec Faker
10.times do
  Dogsitter.create(
    name: Faker::Name.first_name, 
    city: City.all.sample
    )
end

# Créez des chiens avec Faker
15.times do
  Dog.create(
    name: Faker::Name.first_name,
    city: City.all.sample
  )
end

# Créez des promenades (strolls) en associant des chiens et des promeneurs aléatoirement
30.times do
  city = City.all.sample
  dog = Dog.where(city_id: city).sample
  dogsitter = Dogsitter.where(city_id: city).sample
  Strall.create(date: Faker::Time.forward(days: 10, period: :morning), dog: dog, dogsitter: dogsitter)
end