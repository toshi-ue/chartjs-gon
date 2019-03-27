
items_count = 0

15.times do |n|
  random_value = rand(3..10)
  random_value.times do
    items_count += 1
    Item.create!(
      name: "アイテム-#{items_count}",
      price: rand(3000..50000),
      subcategory_id: n + 1
    )
  end
end

puts "created seed items(#{items_count})."
