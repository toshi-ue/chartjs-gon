t = Time.current

def dispTime
  Time.current.strftime("%H:%M:%S")
end

# category's datas
puts "start creating categorys data.( 0 / 6 )[#{dispTime}]"

category_count = 0

3.times do |a|
  category_count += 1
  Category.create!(
    name: "カテゴリー#{(a + 1).to_s}"
  )
end

puts "created categorys data(#{category_count}).( 1 / 6 )"
