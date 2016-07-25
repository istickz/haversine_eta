# Haversine ETA

Запуск сервера API

```bash
$> cd eta_proxy
$> ruby eta_proxy.rb -v -s -e development -p 3000
```

Запуск микросервиса

```bash
$> cd eta_microservice
$> foreman start
```

Тест
```bash
$> curl -X POST localhost:3000/v1/eta/calc -d "lat=55.50" -d "long=20.70"
```

