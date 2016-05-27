require 'digest/sha1'

module IpayHelper

	def self.getsign(s)
        Digest::SHA1.base64digest s
    end

end
