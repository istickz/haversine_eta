class Api < Grape::API
  version 'v1', using: :path
  format :json
  default_format :json

  resource :eta do
    params do
      requires :lon, type: Float
      requires :lat, type: Float
    end

    #NOTICE Caching in this place is not possible
    post '/calc' do
      header 'Rodent-Proxy', 'eta.calc'
      {lon: params[:lon], lat: params[:lat]}
    end
  end
end