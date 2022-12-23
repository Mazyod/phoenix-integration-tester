FROM elixir:1.14

RUN mix local.hex --force

WORKDIR /app

COPY mix.exs mix.lock ./
RUN mix deps.get
