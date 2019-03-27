t = Time.current

def dispTime
  Time.current.strftime("%H:%M:%S")
end

@users = User.all
@items = Item.all
puts "start creating cartitems and order's datas.[#{dispTime}]"

cartitems_count = 0
orders_count = 0

@users.size.times do |i|
  random_execute = rand(0..5)
  unless random_execute == 0

    cartitems = []
    items_ids = @items.pluck(:id)
    random_value = rand(1..4)
    total_price = 0

    random_value.times do
      random_item_id = items_ids.sample
      items_ids.delete(random_item_id)

      cartitems << Cartitem.create!(
        user_id: nil,
        item_id: random_item_id,
        quantity: rand(1..4),
        order_id: nil,
        created_at: (@users[i].created_at) + 10.minute,
        updated_at: (@users[i].created_at) + 10.minute
      )
      cartitems_count += 1
    end

    cartitems.size.times do |z|
      total_price += @items.find_by(id: cartitems[z].item_id).price
    end

    order = Order.create!(
      user_id: i + 1,
      amount: total_price,
      address_id: nil,
      created_at: (@users[i].created_at) + 15 * 60,
      updated_at: (@users[i].created_at) + 15 * 60
    )
    orders_count += 1

    (cartitems.size).times do |n|
      cartitems[n].update!(
        order_id: order.id
      )
    end
  end
end
puts "cartitem's datas were created.(#{cartitems_count})"
puts "order's datas were created.(#{orders_count})"
puts "all datas were created.( 5 / 5 )[#{dispTime}]"
