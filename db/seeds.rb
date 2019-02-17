t = Time.current

# categorys data
10.times do |a|
  Category.create(
    name: "カテゴリー#{(a + 1).to_s}"
  )
end

# subcategorys data
subcategory_count = 0

10.times do |b|
  subcategory_count += 1

  11.times do |c|
    Subcategory.create(
      name: "サブカテゴリー#{((b * 10) + (c + 1)).to_s}",
      category_id: b + 1
    )
  end

end

# items data
item_count = 0
500.times do |item|
  item_count += 1
  # main_category_items
  Item.create!(
    name: "メインアイテム-#{item + 1}",
    price: round(40000..300000)
  )
end



puts "items data creeated"

days1year = 365
user_count = 0

# users_data
10.times do |x|
  # user datas per 1 year
  days1year.times do |z|

    # create users every day
    (rand(1..8) * (x + 1) * (z + 1)).times do |y|

      user_count += 1

      User.create(
        name: "ユーザー#{user_count.to_s}",
        withdrawal: nil,
        created_at: t.ago((days1year * (10 - z)) + (days1year - z))
      )
    end
  end
  now = Time.current
  puts "created #{x + 1}year's datas.\n user_count equals #{user_count}\n(#{now})"
end

puts "users data creeated"



# orders and cartitems data
