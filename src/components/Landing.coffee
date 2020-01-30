import React, { Component } from 'react'

export class Landing extends Component
  constructor: ->
    super()
    @state =
      user_id: null
      access_token: null

  user_logged_in: =>
    @state.user_id && @state.access_token

  componentDidMount: ->
    @subscriptions = [

      PubSub.subscribe "logged in", (msg, {access_token, user_id}) =>
        @setState
          user_id: user_id
          access_token: access_token

      PubSub.subscribe "logged out", =>
        @setState
          user_id: null
          access_token: null
    ]

    @setState
      user_id: localStorage.getItem("user_id")
      access_token: localStorage.getItem("access_token")

  componentWillUnmount: =>
    @subscriptions.forEach(PubSub.unsubscribe)

  render: ->
    <div>{
      if @user_logged_in()
        "Landing Page - logged in"
      else
        "Landing Page - logged out"
    }</div>
