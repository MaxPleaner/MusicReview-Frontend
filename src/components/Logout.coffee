import React, { Component } from 'react'
import PubSub from 'pubsub-js';

export class Logout extends Component
  constructor: ->
    super()

  componentDidMount: ->
    PubSub.publish "logged out"

  render: ->
    <div>
      Logging out ...
    </div>
