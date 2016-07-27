# Haversine ETA

Используемые технологии: Ruby, Goliath, Grape, RabbitMQ.
Для реализации микросервисов выбран Rodent.
Для обмена данными с микросервисами использован AMQP протокол.
В качестве базы данных выбран PostgreSQL.
Для работы с геоданными использован PostGIS.
Кеш реализован с помощью Garner.

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
$> curl -X POST localhost:3000/v1/eta/calc -d "lat=55.986889" -d "long=54.717261"

```

