class Api < Grape::API
  version 'v1', using: :path
  format :json
  default_format :json

  resource :eta do
    params do
      requires :lat, type: Float
      requires :long, type: Float
    end
    post '/calc' do
      header 'Rodent-Proxy', 'eta.calc'
      {lat: params[:lat], long: params[:long]}
    end
  end
end