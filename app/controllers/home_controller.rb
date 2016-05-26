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
		q = "select top 5 custid from customer"
		@lk = []
		res = client.execute(q)
		res.each do |k|
			@lk << k['custid']
		end
		client.close

		render json: @lk
	end

end
