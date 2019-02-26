
t = Time.current
# puts "#{t.ago(3.years) + 1.day}"
# puts "#{t.ago(3.years)}"
# puts "#{t.ago(2.years)}"
# puts "#{t.ago(1.years)}"
# puts "#{t.ago(0.years)}"

days_per_year = 365


def dispTime
  Time.current.strftime("%H:%M:%S")
end

# category's datas
puts "start creating categorys data.( 0 / 6 )[#{dispTime}]"

@categorys = nil
10.times do |a|
  Category.create!(
    name: "カテゴリー#{(a + 1).to_s}"
  )
end


puts "created categorys data(10).( 1 / 6 )"



# subcategory's datas
puts "start creating subcategorys data."

subcategory_count = 0

10.times do |b|
  subcategory_count += 1

  10.times do |c|
    Subcategory.create!(
      name: "サブカテゴリー#{((b * 10) + (c + 1)).to_s}",
      category_id: b + 1
    )
  end
  # puts "  created category-#{(b + 1).to_s}'s subcategory data"
end

puts "finished creating subcategorys data(#{subcategory_count}).( 2 / 6 )"



# user's datas
puts "start creating user's datas."
users = []
user_count = 0

# year
3.times do |g|
  days_per_year.times do |h|
    random_value = rand(0..3)
    unless random_value == 0
      (random_value + (g * 3)).times do |i|
        user_count += 1
       users << User.create!(
          name: "ユーザー　#{user_count.to_s}",
          withdrawal: nil,
          created_at: t.ago((3 - (g + 1)).years)- h.day
        )
      end
    end
  end
  puts "  created user's datas of #{3 - (g + 1)} years ago.[#{dispTime}]"
end

puts "finished creating user's data(#{user_count}).( 3 / 6 )"


# item's data
puts "start creating items data."
items = []
item_count = 0
subcategory_count = 0

# categorys
10.times do |e|
  # puts "  start creating category-#{(e + 1).to_s}'s data"
  # subcategory
  10.times do |f|
    subcategory_count += 1
    rand_value = rand(7..23)
    rand_value.times do
      item_count += 1
        items << Item.create!(
          name: "商品-#{(item_count + 1).to_s}",
          price: rand(4000..300000),
          category_id: e + 1,
          subcategory_id: subcategory_count
        )
    end
    # puts "    created subcategory-#{subcategory_count.to_s}'s data"
  end
  # puts "  created category-#{(e + 1).to_s}'s data"
end

puts "finished creating item's data(#{item_count}).( 4 / 6 )"


# # cartitem's datas
puts "start creating cartitem and orders datas"

users.size.times do |i|

  # p users[i]
  # p users[i].created_at

  # binding.pry

  cartitem = Cartitem.create!(
    user_id: nil,
    item_id: rand(1..item_count),
    quantity: rand(1..4),
    order_id: nil,
    created_at: (users[i].created_at) + 10 * 60,
    updated_at: (users[i].created_at) + 10 * 60
  )

  order = Order.create!(
    user_id: i + 1,
    amount: cartitem.item.price,
    address_id: nil,
    created_at: (users[i].created_at) + 15 * 60,
    updated_at: (users[i].created_at) + 15 * 60
  )

  cartitem.update!(
    order_id: order.id
  )

end
puts "all datas were created.( 0 / 6 )[#{dispTime}]"
