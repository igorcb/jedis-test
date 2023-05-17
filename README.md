# Rails Jedis Test

[https://jedi-test.fly.dev/](https://jedi-test.fly.dev/)

This is a [Ruby on Rails](https://rubyonrails.org/) starter app that connects to a Railway Postgres database and supports [Action Cable](https://guides.rubyonrails.org/action_cable_overview.html).

## ✨ Features

- Ruby
- Rails
- Postgres
- Redis
- Rspec
- Sitimulus
- Active Mailer
- Active Storage (AWS S3)
- Bootstrap pagination
- Send SMS (twilio)
- ZipCode

## 💁‍♀️ How to use

- [Para rodar local](http://localhost:3000)
- Baixe o projeto com git clone
- Entrar na pasta do projeto
- Instalar gems `bundle install`
- Criar Banco de Dados `bundle exec rails db:create`
- Criar as Tabelas do Banco de Dados `bundle exec rails db:migrate`
- Rodar o app `bundle exec rails s -b 0.0.0.0 -p 3000`

- [Para rodar local com docker](http://localhost:3000)
- Baixe o projeto com git clone
- Docker build `docker-compose build`
- Criar Banco de Dados `docker-compose run web rails db:create`
- Rodar o app `docker-compose up -d`

## 📝 Notes

This app was generated with the `rails new` command. Read more about Rails on
their [official website](https://rubyonrails.org/)
