class: center, middle

### web _fonctionnel_ et outils de développement

# `elixir` + `phoenix` 🚀

???

Désolé pour la manque de sexiness de mon titre, mais je voulais éviter les _buzzwords_, mais piquer votre curiosité.

---
class: center, middle

Guillaume Cauchon → `@gcauchon`

Developeur chez .mirego[Mirego]

Fondateur de .alg[À la garderie]

---
# agenda

1. Notions de base: `elixir`, _Beam_ et _OTP_
1. _Actor model_, Immuabilité, fonctions pures
1. Opinions et Conventions
1. Documentation
1. Phoenix
1. La notion de contexte
1. Ecto + Changeset
1. Testing
1. Debugging
1. Transport : Rest, Web Socket, GraphQL

???

- Avant d'aller plus loin, sonder le _knowledge_ de l'équipe...

---
### `elixir`

_Elixir is a dynamic, functional language designed for building scalable and maintainable applications._

--
### Beam

La machine virtuelle `erlang`.

--
### OTP

> Open Telecom Platform

Un ensemble de librairies qui simplifient le développement d’application web et/ou distribuées.

---
Quoi de mieux pour vous "vendre" la stack que de monter un petit projet web qui démontre chaque points à l’agenda?

```shell
> mix phx.new web_fonctionnel --no-brunch --no-html --database=postgres 
```

???

Extraire `DATABASE_URL` pour respecter les concepts 12-Factor.

Setup `docker-compose` pour rouler une database Postgres.

