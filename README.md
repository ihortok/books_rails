# Books

## Install dependencies
```bash
bundle install
yarn install
```

## Setup the database
```bash
rails db:create && rails db:migrate && rails db:seeds
```

## Generate data

### run rake task to generate users
```bash
rake 'data_generator:users[2]'
```

### run rake task to generate books
```bash
rake 'data_generator:books[20]'
```

## Run application

```bash
rails s
bin/webpack-dev-server
```
