# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# list_of_images = [
#   {path_to_image: "girl_and_goat.jpg", name: "whatever"},
#   {path_to_image: "girl_and_goat.jpg", name: "whatever"},
#   {path_to_image: "girl_and_goat.jpg", name: "whatever"}
# ]
# list_of_images = [[ "Lady with Bees": "aws/animals/lady_with_bees.png"],
#                   [ "name": "/path", "name": "/path"]]
# Category.create([{ name: "basic needs" },
#                  { name: "animals" },
#                  { name: "farming" },
#                  { name: "health" }])

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
  "farming_head.jpg",
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
  name: a.sub(/\.\w+\z/, "").gsub("_", " "),
  description: Faker::Lorem.sentence,
  cost: Faker::Commerce.price,
  category: "basic needs",
  image_url: a )
end

animal_needs_list.each do |a|
  NeedType.create(
  name: a.sub(/\.\w+\z/, "").gsub("_", " "),
  description: Faker::Lorem.sentence,
  cost: Faker::Commerce.price,
  category: "animals",
  image_url: a )
end

farming_needs_list.each do |a|
  NeedType.create(
  name: a.sub(/\.\w+\z/, "").gsub("_", " "),
  description: Faker::Lorem.sentence,
  cost: Faker::Commerce.price,
  category: "farming",
  image_url: a )
end

health_needs_list.each do |a|
  NeedType.create(
  name: a.sub(/\.\w+\z/, "").gsub("_", " "),
  description: Faker::Lorem.sentence,
  cost: Faker::Commerce.price,
  category: "health",
  image_url: a )
end
