basic_needs_list = ["auto_maintenance.png",
  "basic_farming_tools.png",
  "bicycle.png",
  "business_cell_phone.png",
  "carpentry_supplies.png",
  "cast_iron_griddle.png",
  "clean_water.png",
  "dairy_equipment.png",
  "electronics_supplies.png",
  "fabric_patterns.png",
  "fishing_supplies.png",
  "housing_materials.png",
  "immunizations.png",
  "irrigation_pumps.png",
  "job_training.png",
  "lifestraws.png",
  "loom.png",
  "market_boat.png",
  "mosquito_net.png",
  "motorbike_with_sidecar.png",
  "place_of_worship_building_supplies.png",
  "pomegranate_seeds.png",
  "retail_startup_fund.png",
  "rickshaw.png",
  "school_supplies.png",
  "scooter.png",
  "sewing_machine.png",
  "shoes.png",
  "small_business_supplies.png",
  "solar_oven.png",
  "spice_seeds.png",
  "stoves.png",
  "town_bridge.png",
  "town_well.png",
  "washing_machine.png"]

animal_needs_list = [
  "alpaca.png",
  "bull.png",
  "camel.png",
  "capybara.png",
  "chicks.png",
  "donkey.png",
  "ducks.png",
  "fish_fingerlings.png",
  "geese.png",
  "goat.png",
  "guinea_fowl.png",
  "heifer.png",
  "honeybees.png",
  "horse.png",
  "llama.png",
  "oxen.png",
  "pig.png",
  "rabbits.png",
  "Sheep.png",
  "silk_moths.png",
  "water_buffalo.png" ]

farming_needs_list = [
  "animal_pen_supplies.png",
  "bountiful_harvest.png",
  "cocoa_seeds.png",
  "coffee_seeds.png",
  "corn_mill.png",
  "corn_seeds.png",
  "family_farm.png",
  "flower_seeds.png",
  "gardening_supplies.png",
  "guava_seeds.png",
  "lettuce_seeds.png",
  "pepper_seeds.png",
  "poultry_farm_equipment.png",
  "rice_seeds.png",
  "soy_bean_seeds.png",
  "sugar_cane_starters.png",
  "tomato_seeds.png",
  "trees.png",
  "wheat_mill.png",
  "wheat_seeds.png"]

health_needs_list = [
  "diptheria_vaccine.png",
  "infant_care.png",
  "influenza_vaccine.png",
  "measles_vaccine.png",
  "pediatric_dentistry.png",
  "polio_vaccine.png",
  "prenatal_vitamins.png",
  "preventive_medicine.png",
  "rubella_shots.png",
  "tetanus_vaccine.png",
  "veternary_care.png",
  "vision_care.png",
  "vision_checks.png",
  "vitamin_boost.png",
  "well_baby_vitamins.png",
  "womens_health_care.png",
  "RV_shot.png" ]

basic_needs_list.each do |a|
  NeedType.create(
  name: a.sub(/\.\w+\z/, "").gsub("_", " ").split.each do {|name| name.capitalize.join(" ")},
  description: Faker::Lorem.paragraph(9, false, 2),
  cost: Faker::Commerce.price,
  category_id: Category.find_or_create_by(name: "basic needs").id,
  image_url: a )
end

animal_needs_list.each do |a|
  NeedType.create(
  name: a.sub(/\.\w+\z/, "").gsub("_", " "),
  description: Faker::Lorem.paragraph(9, false, 2),
  cost: Faker::Commerce.price,
  category_id: Category.find_or_create_by(name: "animals").id,
  image_url: a )
end

farming_needs_list.each do |a|
  NeedType.create(
  name: a.sub(/\.\w+\z/, "").gsub("_", " "),
  description: Faker::Lorem.paragraph(9, false, 2),
  cost: Faker::Commerce.price,
  category_id: Category.find_or_create_by(name: "farming").id,
  image_url: a )
end

health_needs_list.each do |a|
  NeedType.create(
  name: a.sub(/\.\w+\z/, "").gsub("_", " "),
  description: Faker::Lorem.paragraph(9, false, 2),
  cost: Faker::Commerce.price,
  category_id: Category.find_or_create_by(name: "health").id,
  image_url: a )
end

# USERS
# __________________________________________________________
recipients_list = [
  "1.png",
  "2.jpg",
  "3.jpg",
  "4.jpg",
  "5.jpg",
  "6.jpg",
  "7.jpg",
  "8.jpg",
  "9.jpg",
  "10.jpg",
  "11.jpg",
  "12.jpg",
  "13.jpg",
  "14.jpg",
  "15.jpg",
  "16.jpg",
  "17.jpg",
  "18.jpg",
  "19.jpg",
  "20.png",
  "21.jpg",
  "22.JPG",
  "23.jpg",
  "24.jpg",
  "25.jpg",
  "26.jpg",
  "27.jpg",
  "28.jpeg",
  "29.png",
  "30.jpg",
  "40.jpg",
  "41.jpg",
  "42.jpg",
  "43.png",
  "44.jpg",
  "45.jpg",
  "46.jpg",
  "47.jpg",
  "48.jpg",
  "49.jpg",
  "50.jpg",
  "51.jpg",
  "ladies.jpg"
]

donors_list = [
  "a.jpg",
  "b.jpg",
  "c.png",
  "d.jpeg",
  "e.jpg",
  "f.jpg",
  "g,.jpg",
  "h.jpg",
]

admins_list = [
  "hedy.png",
  "jared.jpeg",
  "jon.jpeg",
  "kris.jpeg",
]

User.create(first_name: "Mike", last_name: "Dao", email: "mike.dao@gmail.com", password: "password", role: 1, username: "MikeDao", country: "US", image_url: "global_admin.png")

recipients_list.each do |a|
  User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.safe_email,
  city: Faker::Address.city,
  country: Faker::Address.country,
  username: Faker::Internet.user_name,
  password: Faker::Internet.password,
  role: 2,
  description: Faker::Lorem.paragraph(6, false, 1),
  image_url: a )
end

donors_list.each do |a|
  User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.safe_email,
  city: Faker::Address.city,
  country: Faker::Address.country,
  username: Faker::Internet.user_name,
  password: Faker::Internet.password,
  role: 0,
  description: Faker::Lorem.paragraph(6, false, 1),
  image_url: a )
end

admins_list.each do |a|
  User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.safe_email,
  city: Faker::Address.city,
  country: Faker::Address.country,
  username: Faker::Internet.user_name,
  password: Faker::Internet.password,
  role: 1,
  description: Faker::Lorem.paragraph(6, false, 1),
  image_url: a )
end
