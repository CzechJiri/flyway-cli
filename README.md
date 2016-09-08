# Super Simple docker with flyway 4.03 CLI


This is small sample based on `sample` app. In a nutsheel

1. run this from the root of your app directory
2. it assumes flyway.conf and migrations exists relative to current directory
3. postgres in this context is assumed to be exposed on the host's localhost (it can run in a container or directly on the host)
4. first time you run it, its going to be slow because the image needs to be cached, all following runs will be really fast

small note: you can put the postgres URL int the config, I leave it outside simply because that is probbly the only parameter changing between environments

*MIGRATE*
```
docker run -v $(pwd):/app \
           --net=host \
           -h 127.0.0.1 \
           myrepo/flyway-cli \
           flyway migrate -configFile=db/src/main/db/sample/flyway.conf -url=jdbc:postgresql://localhost:5432/sample
```

*CLEAN*
```
docker run -v $(pwd):/app \
           --net=host \
           -h 127.0.0.1 \
           myrepo/flyway-cli \
           flyway clean -configFile=db/src/main/db/sample/flyway.conf -url=jdbc:postgresql://localhost:5432/sample
```


*sample.conf*
```
flyway.locations=filesystem:db/src/main/db/sample/migrations/
flyway.sqlMigrationPrefix=v_
flyway.sqlMigrationSuffix=.sql
flyway.placeholderPrefix=${
flyway.placeholderSuffix=}
flyway.user=flyway
flyway.schemas=sample
flyway.placeholders.RELEASE_SCHEMA=sample
flyway.placeholders.DBO_CREDENTIAL=blabla

```
