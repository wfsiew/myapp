class HomeController < ApplicationController

    def index
      @data = 'hello'
      render
    end

    def data
      @data = Customer.new(9, 'ben')
      @x = [1, 2, 3]
      render json: @data
    end

    def rec
      client = TinyTds::Client.new username: 'CallBilling', password: 'CBPWD12345', host: '192.168.138.120', database: 'HSBB_Billing'
      q = "select top 5 custid, name from customer"
      @lk = []
      res = client.execute(q)
      res.each do |k|
          o = Customer.new(k['custid'], k['name'])
          @lk << o
      end
      client.close

      render json: @lk
    end

    def mail
      HomeMailer.welcome('siewwingfei@hotmail.com').deliver_now
      render plain: 'ok'
    end

    def submit
      name = params[:name]
      puts name
      redirect_to action: :index
    end

    def tests
      @data = 'hello'
      j = render_to_string layout: false
      p j
      render plain: j
    end

end
