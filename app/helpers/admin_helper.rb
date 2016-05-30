require 'net/http'
require 'uri'
require 'json'

module AdminHelper
  def self.get(url, params)
    uri = URI(url)
    uri.query = URI.encode_www_form(params)
    req = Net::HTTP::Get.new(uri)
    result = Net::HTTP.start(uri.hostname, use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http| 
      http.request req
    end
    result.body
  end

  def self.post(url, params)
    uri = URI(url)
    req = Net::HTTP::Post.new(uri)
      req.set_form_data(params)
      result = Net::HTTP.start(uri.hostname, use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http| 
      http.request req
    end
    result.body
  end

  def self.tojson(s)
    JSON.parse s
  end
end
