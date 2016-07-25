class ApiListener < Rodent::Base
  listen 'eta.calc' do
    self.status = 200
    eta = EtaService.new(params)
    eta.as_json
  end
end