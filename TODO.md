THINGS TO DO:

- persist JSON of game state somewhere
- actually build the tracker itself >>
- on reload, load game state and update UI
- don't allow users to update current game state if they aren't either the owner or have the GET param token
- the actual fun websocket work (updating all current viewers on change)
  - do we send a delta, or the entire game JSON?
  - deal with weird race conditions and state divergence as necessary
- authentication for user (not necessary for initial MVP)
  - start out with a basic session-based auth
  - eventually add full user registration (over OAuth for simplicity)
