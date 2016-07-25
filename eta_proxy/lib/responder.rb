class Responder < Goliath::API
  plugin Rodent::Goliath::Plugin
  use Rodent::Goliath::Middleware

  def response(env)
    Api.call(env)
  end
end
