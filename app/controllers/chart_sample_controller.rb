class ChartSampleController < ApplicationController
  def index
    t = Time.current
    this_year = t.year
    this_month = t.month
    this_month_days = t.end_of_month.day
    today = t.day
    day = 24 * 60 * 60
    youbi = %w[日 月 火 水 木 金 土]

    # label of x-axis
    gon.labels = []
    this_month_days.times do |i|
      gon.labels << "#{i + 1}(#{youbi[(t.beginning_of_month + i * day).wday]})"
    end
    # orders = Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)").where('created_at >= ?', t.beginning_of_month)
    # @orders = Order.includes([:user, :address, cartitems: :item]).where('created_at >= ?', t.beginning_of_month)
    @orders = Order.where('created_at >= ?', t.beginning_of_month)
    @sales_per_day = @orders.group("DAY(created_at)").sum(:amount)
    @signup_users = User.where('created_at >= ?', t.beginning_of_month)
    @users_per_day = @signup_users.group("DAY(created_at)").count(:id)
    # @users_per_day = @orders.group("DAY(created_at)").count(:user_id)

    gon.sales = []
    this_month_days.times do |i|
      if @sales_per_day[i+1] == nil
        gon.sales << 0
      else
        gon.sales << @sales_per_day[i+1]
      end
      # @sales << @sales_per_day[i+1] == nil? ? 0 : @sales_per_day[i+1]
      # @sales << @sales_per_day[i+1] || 0
    end

    gon.sign_up_users = []
    this_month_days.times do |i|
      if @users_per_day[i+1] == nil
        gon.sign_up_users << 0
      else
        gon.sign_up_users << @users_per_day[i+1]
      end
    end



    # binding.pry

    gon.data = []
    this_month_days.times do
      gon.data << rand(100.0)
    end
  end
end
