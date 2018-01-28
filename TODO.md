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

ummm what are we working on today ><
- let's build out our basic param-based token authentication!

token authentication:
- the game "token" (really just a 20 char string) is identical for all users. If a user passes it as a GET param to the show page, embed a signed phoenix token into the page, which is used by the JS client to connect to an EDIT channel
- all users can freely connect to a non-verified ws channel, and receive updates from editors
- all updates are sent to both channels, but non-verified is unidirectional, and each user is only added to one channel at a time
