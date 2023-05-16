---
title: Rails Starter
description: A Rails starter app using a PostgreSQL database
tags:
  - ruby
  - rails
  - postgresql
---

# Rails Starter Example

This is a [Ruby on Rails](https://rubyonrails.org/) starter app that connects to a Railway Postgres database and supports [Action Cable](https://guides.rubyonrails.org/action_cable_overview.html).

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/sibk1f)

## ✨ Features

- Ruby
- Rails
- Postgres
- Redis
- Rspec
- Simulus
- Active Storage (AWS S3)
- Bootstrap pagination
- Send SMS (twilio)

## 💁‍♀️ How to use

- [Para rodar local](http://localhost:3000)
- Baixe o projeto com git clone
- Entrar na pasta do projeto
- Instalar gems `bundle install`
- Criar Banco de Dados `bundle exec rails db:create`
- Criar as Tabelas do Banco de Dados `bundle exec rails db:migrate`
- Rodar o app `bundle exec rails s -b 0.0.0.0 -p 3000`

- [Para rodar local com docker](http://localhost:3000)
- Connect to your Railway project with `railway link`
- Install Ruby requirements `bundle install`
- Migrate the database `railway run rake db:migrate`
- Run Rails `railway run bin/rails server`

## 📝 Notes

This app was generated with the `rails new` command. Read more about Rails on
their [official website](https://rubyonrails.org/)
