module HomeHelper
	def upper(x)
		x.upcase
	end
end

class Customer
	def initialize(id, name)
		@custid = id
		@name = name
	end
end
