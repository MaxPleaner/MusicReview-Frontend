import React, { Component } from 'react'
$ = require 'jquery'

export class Landing extends Component
  constructor: (props) ->
    super()
    @props = props

  user_logged_in: =>
    @props.user

  render: ->
    <div>
      <h4>{
        if @props.user
          "Hello #{@props.user.name}"
        else
          "Landing page (logged out)"
      }</h4>
    </div>
