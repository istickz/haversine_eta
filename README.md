# Haversine ETA

Запуск сервера API

```bash
$> ruby eta_proxy.rb -v -s -e development -p 3000
```

Запуск микросервиса

```bash
$> ruby eta_microservice.rb
```

Тест
```bash
$> curl -X POST localhost:3000/v1/eta/calc -d "lat=55.50" -d "long=20.70"
```

