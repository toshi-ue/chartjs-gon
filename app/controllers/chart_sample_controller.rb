class ChartSampleController < ApplicationController
  def index
    t = Time.current
    this_year = t.year
    this_month = t.month
    this_month_days = t.end_of_month.day
    today = t.day
    day = 24 * 60 * 60
    youbi = %w[日 月 火 水 木 金 土]

    # orders = Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)").where('created_at >= ?', t.beginning_of_month)
    # @orders = Order.includes([:user, :address, cartitems: :item]).where('created_at >= ?', t.beginning_of_month)
    @orders = Order.where('created_at >= ?', t.beginning_of_month)
    @sales_per_day = @orders.group("DAY(created_at)").sum(:amount)
    @signup_users = User.where('created_at >= ?', t.beginning_of_month)
    @users_per_day = @signup_users.group("DAY(created_at)").count(:id)
    # @users_per_day = @orders.group("DAY(created_at)").count(:user_id)

    # graph's title
    gon.title = "売上推移(#{this_year}/#{this_month})"
    # label of x-axis
    gon.labels = []
    this_month_days.times do |i|
      gon.labels << "#{i + 1}(#{youbi[(t.beginning_of_month + i * day).wday]})"
    end

    # create array of sales per day
    gon.sales = []
    gon.max_sales = 0

    this_month_days.times do |i|
      @sales_per_day[i+1] = 0 if @sales_per_day[i+1].nil?
      gon.sales << @sales_per_day[i+1]
      gon.max_sales = @sales_per_day[i+1] if gon.max_sales < @sales_per_day[i+1]
    end

    # count length of max sales
    digits_count = gon.max_sales.to_s.length
    gon.value_for_graph = gon.max_sales.ceil(-(digits_count-2))

    # create array of users_count per day
    gon.sign_up_users = []
    this_month_days.times do |i|
      @users_per_day[i+1] = 0 if @users_per_day[i+1].nil?
      gon.sign_up_users << @users_per_day[i+1]
    end
  end
end
