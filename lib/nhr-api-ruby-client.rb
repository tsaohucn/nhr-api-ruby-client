module Nhr
  class Client

    attr_accessor :response
	  attr_reader :nhr_url, :token, :gateway_id, :action, :stime, :etime, :device_ieee, :cmdvalue

  	def initialize(nhr_url: nil, token: nil, gateway_id: nil, device_ieee: nil, cmdvalue: nil, action: nil, stime: nil, etime: nil)
  	  @nhr_url = nhr_url
  	  @token = token
  	  @gateway_id = gateway_id
      @device_ieee = device_ieee
  	  @action = action
  	  @stime = stime
  	  @etime = etime
      @cmdvalue = cmdvalue
  	  client
  	end

  	def client
      parameter = {token: @token, gateway_id: @gateway_id, action: @action, stime: @stime, etime: @etime, device_ieee: @device_ieee, cmdvalue: @cmdvalue}
      formdata = URI.encode_www_form(parameter)
      response = RestClient::Resource.new(@nhr_url, :ssl_version => 'TLSv1').post(formdata)  
      raise "response nil" if response == nil
      response = JSON.parse(response.split(';')[-1].gsub("\r\n\t\r\n?>\t",'')) 
      raise "#{response},gateway_id: #{@gateway_id}" unless response['status'] == true	
      @response = response
  	end

  end
end