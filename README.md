# Rumbl

## Development

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Useful commands

- `iex -S mix`
  - `:observer.start()`
- `mix test [<file-path>]`
- `mix ecto.migrate`
- `mix ecto.rollback`
- `mix phx.routes`
- `mix deps.get`
- `mix run priv/repo/seeds.exs`
- `mix ecto.gen.migration create_categories`
- `mix phx.gen.presence`
- `mix phx.gen.schema Multimedia.Category categories name:string`
- `mix phx.gen.context Multimedia Category categories name:string`
- `mix phx.gen.html Multimedia Video videos user_id:references:users url:string`
  - Context: `Multimedia`
  - Module that defines the schema: `Video`
  - Plural form of the schema name: `videos`
  - Fields with type information
