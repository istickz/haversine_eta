# Haversine ETA

Используемые технологии: Ruby, Goliath, Grape, RabbitMQ.

Для обмена данными с микросервисом использован AMQP протокол.

В качестве базы данных выбран PostgreSQL.

Для работы с геоданными использован PostGIS.

Запуск сервера API

```bash
$> cd eta_proxy
$> foreman start
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

