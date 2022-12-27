FROM elixir:1.14

RUN mix local.hex --force \
  && mix local.rebar --force

WORKDIR /app

COPY mix.exs mix.lock ./
RUN mix deps.get

COPY . .

ENV MIX_ENV=dev
ENTRYPOINT [ "mix" ]
CMD [ "phx.server" ]
