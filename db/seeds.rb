# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



manhattanNeighbourhoods = ["Alphabet City",
"Battery Park City",
"Carnegie Hill",
"Chelsea",
"Chinatown",
"East Harlem",
"East Village",
"Financial District",
"Flatiron District",
"Gramercy Park",
"Greenwich Village",
"Harlem",
"Hell's Kitchen/Clinton",
"Inwood",
"Kips Bay",
"Lincoln Square",
"Lower East Side",
"Manhattan Valley",
"Midtown East",
"Midtown West",
"Morningside Heights",
"Murray Hill",
"NoLita/Little Italy",
"Roosevelt Island",
"SoHo",
"Tribeca",
"Upper East Side",
"Upper West Side",
"Washington Heights",
"West Village"]


City.create!(name:"NYC")
manhattanNeighbourhoods.each {|neighbourhood| Neighbourhood.create!(name: neighbourhood, city_id: 1)}
