defmodule ZetsTrackerWeb.GameSocket do
  use Phoenix.Socket

  @one_day 60 * 60 * 24

  ## Channels
  channel "game:*", ZetsTrackerWeb.GameChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket
  # transport :longpoll, Phoenix.Transports.LongPoll

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  def connect(%{"token" => token}, socket) do
    salt = Application.get_env(:zetsTracker, :signing_salt)
    case Phoenix.Token.verify(socket, salt, token, max_age: @one_day) do
      {:ok, "auth"} ->
        {:ok, socket}
      {:ok, "unauth"} ->
        {:ok, socket}
      {:error, _} ->
        :error
      _ ->
        :error
    end
    {:ok, socket}
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     ZetsTrackerWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
