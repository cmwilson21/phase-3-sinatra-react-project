puts "🌱 Seeding spices..."


# Seed your database here

wandavision = Show.create(name: "WandaVision", network: "Disney Plus")
cobrakai = Show.create(name: "Cobra Kai", network: "Netflix")
lasso = Show.create(name: "Ted Lasso", network: "Apple TV Plus")

wanda = Character.create(name: "Wanda Maximoff", show_id: wandavision.id)
vision = Character.create(name: "Vision", show_id: wandavision.id)
daniel = Character.create(name: "Daniel LaRusso", show_id: cobrakai.id)
johnny = Character.create(name: "Johnny Lawrence", show_id: cobrakai.id)
ted = Character.create(name: "Ted Lasso", show_id: lasso.id)
roy = Character.create(name: "Roy Kent", show_id: lasso.id)

puts "✅ Done seeding!"
