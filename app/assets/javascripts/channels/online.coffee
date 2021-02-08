jQuery(document).on 'turbolinks:load', ->
  App.online = App.cable.subscriptions.create { channel: "OnlineChannel" },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
        users = data['users'].map (i) -> i['nickname']
        $('#online-users').text(users.join(', '))
