class OnlineChannel < ApplicationCable::Channel
  def subscribed
    current_user.update(online: true)
    stream_from "online_channel"
    render_users
  end

  def unsubscribed
    current_user.update(online: false)
    render_users
  end

  private

  def render_users
    ActionCable.server.broadcast "online_channel",
                                 users: User.online
  end
end
