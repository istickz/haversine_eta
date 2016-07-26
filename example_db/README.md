# Haversine ETA DB Example

Создайте базу данных app_development в Postgresql и добавьте postgis

```bash
$> psql app_development -c 'create extension postgis;'
```

Выполните миграции и сиды

```bash
$> rake migrate 
$> rake seed
```


