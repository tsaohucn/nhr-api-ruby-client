require './lib/nhr-api-ruby-client'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # other config options here...    

end

describe Nhr::Client do
  before(:all) do #itri-tomato.project@insnergy.com
    @nhr_url = 'http://59.124.104.45/api/getinformation.php'
    @token = '762a2cd972e278df40f9425ecfdaf486e6efedf8c1be02e3a227ce'
    @action = 'GetPlugPowerConsumption'
    @cmdvalue = '1'
    @device_ieee = '00124B000426162F'
    @gateway_id = '319'
    @stime = Time.new('2016','12','01').to_s
    @etime = Time.new('2017','01','01').to_s
    #@nhr = Nhr::Client.new(nhr_url: nhr_url, token: token, action: action, device_ieee: device_ieee, cmdvalue: cmdvalue)
  end

  it 'should get response' do
    p Nhr::Client.new(nhr_url: @nhr_url, token: @token, action: @action, gateway_id: @gateway_id, device_ieee: @device_ieee, cmdvalue: @cmdvalue, stime: @stime, etime: @etime).response
  end
end