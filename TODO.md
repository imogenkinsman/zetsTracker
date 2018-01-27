THINGS TO DO:

- persist JSON of game state somewhere
- actually build the tracker itself >>
  - for a first pass, just build an item tracker, don't track locations
  - it is ESSENTIAL that the tracker not look awful, and is formatted well to show up on twitch streams (any nav or side bars must hide easily)
- on reload, load game state and update UI
- don't allow users to update current game state if they aren't either the owner or have the GET param token
- the actual fun websocket work (updating all current viewers on change)
  - do we send a delta, or the entire game JSON?
  - deal with weird race conditions and state divergence as necessary
- authentication for user (not necessary for initial MVP)
  - start out with a basic session-based auth
  - eventually add full user registration (over OAuth for simplicity)
