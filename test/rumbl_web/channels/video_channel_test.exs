defmodule RumblWeb.Channels.VideoChannelTest do
  use RumblWeb.ChannelCase
  import Rumbl.TestHelpers

  setup do
    user = insert_user(name: "Gary")
    video = insert_video(user, title: "Testing")
    token = Phoenix.Token.sign(@endpoint, "user socket", user.id)
    {:ok, socket} = connect(RumblWeb.UserSocket, %{"token" => token})

    {:ok, socket: socket, user: user, video: video}
  end

  test "join replies with video annotations", %{socket: socket, video: vid, user: user} do
    for body <- ~w(One Two) do
      Rumbl.Multimedia.annotate_video(user, vid.id, %{body: body, at: 0})
    end

    {:ok, reply, socket} = subscribe_and_join(socket, "videos:#{vid.id}", %{})

    assert socket.assigns.video_id == vid.id
    assert %{annotations: [%{body: "One"}, %{body: "Two"}]} = reply
  end

  test "inserting new annotations", %{socket: socket, video: vid} do
    {:ok, _, socket} = subscribe_and_join(socket, "videos:#{vid.id}", %{})
    ref = push socket, "new_annotation", %{body: "The Body", at: 0}

    assert_reply ref, :ok, %{}
    assert_broadcast "new_annotation", %{}
  end
end
