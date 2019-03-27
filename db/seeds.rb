
# t = Time.current
# puts "#{t.ago(3.years) + 1.day}"
# puts "#{t.ago(3.years)}"
# puts "#{t.ago(2.years)}"
# puts "#{t.ago(1.years)}"
# puts "#{t.ago(0.years)}"

# days_per_year = 365


# def dispTime
#   Time.current.strftime("%H:%M:%S")
# end

# category's datas
# puts "start creating categorys data.( 0 / 6 )[#{dispTime}]"

# category_count = 0

# 10.times do |a|
#   category_count += 1
#   Category.create!(
#     name: "カテゴリー#{(a + 1).to_s}"
#   )
# end

# puts "created categorys data(10).( 1 / 6 )"



# # subcategory's datas
# puts "start creating subcategorys data."

# subcategory_count = 0

# 10.times do |b|
#   subcategory_count += 1

#   10.times do |c|
#     Subcategory.create!(
#       name: "サブカテゴリー#{((b * 10) + (c + 1)).to_s}",
#       category_id: b + 1
#     )
#   end
#   # puts "  created category-#{(b + 1).to_s}'s subcategory data"
# end

# puts "finished creating subcategorys data(#{subcategory_count}).( 2 / 6 )"



# 08


# # cartitem's datas
# puts "start creating cartitem and orders datas"

# users.size.times do |i|

  # p users[i]
  # p users[i].created_at

  # binding.pry

#   cartitem = Cartitem.create!(
#     user_id: nil,
#     item_id: rand(1..item_count),
#     quantity: rand(1..4),
#     order_id: nil,
#     created_at: (users[i].created_at) + 10 * 60,
#     updated_at: (users[i].created_at) + 10 * 60
#   )

#   order = Order.create!(
#     user_id: i + 1,
#     amount: cartitem.item.price,
#     address_id: nil,
#     created_at: (users[i].created_at) + 15 * 60,
#     updated_at: (users[i].created_at) + 15 * 60
#   )

#   cartitem.update!(
#     order_id: order.id
#   )

# end
# puts "all datas were created.( 0 / 6 )[#{dispTime}]"
