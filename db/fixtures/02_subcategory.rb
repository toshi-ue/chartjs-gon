# subcategory's datas
puts "start creating subcategorys data."

subcategory_count = 0

3.times do |b|
  subcategory_count += 1

  5.times do |c|
    Subcategory.create!(
      name: "サブカテゴリー#{((b * 10) + (c + 1)).to_s}",
      category_id: b + 1
    )
  end
  # puts "  created category-#{(b + 1).to_s}'s subcategory data"
end

puts "finished creating subcategorys data(#{subcategory_count}).( 2 / 6 )"
