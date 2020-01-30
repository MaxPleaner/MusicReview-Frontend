import React, { Component } from 'react'

export class Landing extends Component
  constructor: (props) ->
    super()
    @props = props

  user_logged_in: =>
    @props.user_id && @props.access_token

  render: ->
    <div>{
      if @user_logged_in()
        "Landing Page - logged in"
      else
        "Landing Page - logged out"
    }</div>
