# [POC] Demosic

Demosic is a web-based local music streaming server which goal is to allows multiple-user to choose music from several sources (Local, Youtube, Spotify..). Given that, this project can have severals evolutions.
It's bring to life thank's to the power of the [Pheonix framework](https://phoenixframework.org/) for the web interface combine with the [Membrane Framework](https://www.membraneframework.org/) to manage a music player.

# Project State

It's just a proof of concept right now so it's really limited and not ready to use. Actually, Demosic wait for [DistilTube](https://github.com/kiuKisas/DistilTube) to be ready before going further.
 
# Plan for 0.1 release
- [ ] add admin user interface to manage user, authorization, local musics and other basics stuffs
- [ ] implement youtube source
- [ ] play/pause implementation through websockets
- [ ] bring membrane and youtube stream together

# Installation

To initialate the project:
  * Install dependencies with `mix deps.get`
  * Generate a secret key withe the command `mix guardian.gen.secret` to use `Guardian` with jwt and copy it into `dev.secret.exs` or `prod.secret.exs` as this following example:
  ```
# Guardian secret_key 
config :demosic, Demosic.Auth.Guardian,
  issuer: 'demosic',
  secret_key: "MY_AMAZING_SECRET_KEY"
  ```
To start your Phoenix server:
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install` or `cd assets && yarn install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

