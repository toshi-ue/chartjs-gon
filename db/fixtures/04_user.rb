def dispTime
  Time.current.strftime('%H:%M:%S')
end

def days_of_thisyear
  t = Time.current
  ((t - t.beginning_of_year) / 60 / 60 / 24).to_i + 1
end

def days_of_year(a)
  t = Time.current
  return (((t - a.years).end_of_year - (t - a.years).beginning_of_year + 1) / 60 / 60 / 24).to_i
end

t = Time.current
users_count = 0

puts "start seed user's data.[#{dispTime}]"
3.times do |a|
  years_count = 3 - (a + 1)
  days =
  case years_count
  when 0 then
    days_of_thisyear
  else
    days_of_year(a)
  end

  days.times do |b|
    random_value = rand(0..3)
    unless random_value == 0
      first_day = (t - years_count.years).beginning_of_year
      (random_value + a).times do |c|
        users_count += 1
        User.create!(
          name: "ユーザー#{users_count}",
          withdrawal: nil,
          created_at: first_day + b.day + (c * 10).minute,
          updated_at: first_day + b.day + (c * 10).minute
        )
      end
    end
  end

  puts "  created users #{a} years ago(#{users_count}). [#{dispTime}]"
end

puts "finished seed user's data(#{users_count}). [#{dispTime}]"
