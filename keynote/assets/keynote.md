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
## `elixir`

_Elixir is a dynamic, functional language designed for building scalable and maintainable applications._

--
### Beam

La machine virtuelle `erlang`.

--
### OTP

> Open Telecom Platform

_OTP (Open Telecom Platform) is a set of libraries that ships with Erlang. Erlang developers use OTP to build robust, fault-tolerant applications._

---
# `mix`

```shell
> mix help
mix                    # Runs the default task (current: "mix run")
mix app.start          # Starts all registered apps
mix app.tree           # Prints the application tree
mix archive            # Lists installed archives
mix archive.build      # Archives this project into a .ez file
mix archive.install    # Installs an archive locally
mix archive.uninstall  # Uninstalls archives
mix clean              # Deletes generated application files
mix cmd                # Executes the given command
mix compile            # Compiles source files
mix deps               # Lists dependencies and their status
mix deps.clean         # Deletes the given dependencies' files
mix deps.compile       # Compiles dependencies
mix deps.get           # Gets all out of date dependencies
mix deps.tree          # Prints the dependency tree
mix deps.unlock        # Unlocks the given dependencies
mix deps.update        # Updates the given dependencies
mix do                 # Executes the tasks separated by comma
mix ecto               # Prints Ecto help information
mix ecto.create        # Creates the repository storage
mix ecto.drop          # Drops the repository storage
mix ecto.dump          # Dumps the repository database structure
mix ecto.gen.migration # Generates a new migration for the repo
mix ecto.gen.repo      # Generates a new repository
mix ecto.load          # Loads previously dumped database structure
mix ecto.migrate       # Runs the repository migrations
mix ecto.migrations    # Displays the repository migration status
mix ecto.rollback      # Rolls back the repository migrations
mix escript            # Lists installed escripts
mix escript.build      # Builds an escript for the project
mix escript.install    # Installs an escript locally
mix escript.uninstall  # Uninstalls escripts
mix format             # Formats the given files/patterns
mix gettext.extract    # Extracts translations from source code
mix gettext.merge      # Merge template files into translation files
mix help               # Prints help information for tasks
mix hex                # Prints Hex help information
mix hex.audit          # Shows retired Hex deps for the current project
mix hex.build          # Builds a new package version locally
mix hex.config         # Reads, updates or deletes local Hex config
mix hex.docs           # Fetches or opens documentation of a package
mix hex.info           # Prints Hex information
mix hex.organization   # Manages Hex.pm organizations
mix hex.outdated       # Shows outdated Hex deps for the current project
mix hex.owner          # Manages Hex package ownership
mix hex.publish        # Publishes a new package version
mix hex.repo           # Manages Hex repositories
mix hex.retire         # Retires a package version
mix hex.search         # Searches for package names
mix hex.user           # Manages your Hex user account
mix loadconfig         # Loads and persists the given configuration
mix local              # Lists local tasks
mix local.hex          # Installs Hex locally
mix local.phoenix      # Updates Phoenix locally
mix local.phx          # Updates the Phoenix project generator locally
mix local.public_keys  # Manages public keys
mix local.rebar        # Installs Rebar locally
mix new                # Creates a new Elixir project
mix phoenix.gen.html   # Generates controller, model and views for an HTML based resource
mix phoenix.new        # Creates a new Phoenix v1.3.2 application
mix phoenix.server     # Starts applications and their servers
mix phx.digest         # Digests and compresses static files
mix phx.digest.clean   # Removes old versions of static assets.
mix phx.gen.channel    # Generates a Phoenix channel
mix phx.gen.context    # Generates a context with functions around an Ecto schema
mix phx.gen.embedded   # Generates an embedded Ecto schema file
mix phx.gen.html       # Generates controller, views, and context for an HTML resource
mix phx.gen.json       # Generates controller, views, and context for a JSON resource
mix phx.gen.presence   # Generates a Presence tracker
mix phx.gen.schema     # Generates an Ecto schema and migration file
mix phx.gen.secret     # Generates a secret
mix phx.new            # Creates a new Phoenix v1.3.2 application
mix phx.new.ecto       # Creates a new Ecto project within an umbrella project
mix phx.new.web        # Creates a new Phoenix web project within an umbrella project
mix phx.routes         # Prints all routes
mix phx.server         # Starts applications and their servers
mix profile.cprof      # Profiles the given file or expression with cprof
mix profile.eprof      # Profiles the given file or expression with eprof
mix profile.fprof      # Profiles the given file or expression with fprof
mix run                # Starts and runs the current application
mix test               # Runs a project's tests
mix xref               # Performs cross reference checks
iex -S mix             # Starts IEx and runs the default task
```

???

Fortement inspiré de `rails`/`rake`

---
Quoi de mieux pour vous "vendre" la stack que de monter un petit projet web qui démontre chaque points à l’agenda?

```shell
> mix phx.new web_fonctionnel --no-brunch --no-html --database=postgres 
```

On peut lancer le serveur en une seule commande `mix`.

```shell
> mix phx.server
```

That’s it…

[localhost:4000](http://localhost:4000)


???

### NB

Par défaut, le générateur avec `--database` paramétrise l’accès à la BD directement dans les fichiers de configuration. (`dev.exs`, `prod.exs`, …)

↳ Extraire `DATABASE_URL` pour respecter les concepts **12-Factor**.

------

### `docker` ftw.

Setup `docker-compose` pour rouler une database Postgres et les dépendences "hardware".

- Très efficace en développement.
- Encore plus utile pour la maintenance.


---
class: center, middle

Un peu de code!
