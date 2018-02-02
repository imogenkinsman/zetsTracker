# ZetsTracker

ZetsTracker is an item tracker for the [Zelda: Link to the Past Randomizer](vt.alttp.run/randomizer). Its main distinction from other trackers is that it has real-time collaborative updates, allowing streamers of the game to focus on playing and outsource the work to viewers who they trust.

## Contributing

This is currently pre-alpha, but once the featureset is complete, open beta will begin. At that time, suggestions or bug reports are welcome here as issues.

For running the tracker locally:

  * Pull down the repo and [install Elixir](https://elixir-lang.org/install.html).
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
