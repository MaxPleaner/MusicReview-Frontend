import React, { Component } from 'react'
import { Routes } from "./Routes.coffee"
import { Nav } from "./components/Nav.coffee"
import { Router } from 'react-router-dom'
import history from './history.coffee';

export class Layout extends Component
  constructor: ->
    super()

    @state =
      user_id: null,
      access_token: null

  componentDidMount: =>
    @subscriptions = [

      PubSub.subscribe "logged in", (msg, {access_token, user_id}) =>
        localStorage.setItem "user_id", user_id
        localStorage.setItem "access_token", access_token
        @setState { user_id, access_token }
        # debugger
        history.push('/')

      PubSub.subscribe "logged out", =>
        localStorage.removeItem "user_id"
        localStorage.removeItem "access_token"
        @setState { user_id: null, access_token: null }
        history.push('/')
    ]

    @setState
      user_id: localStorage.getItem("user_id")
      access_token: localStorage.getItem("access_token")

  componentWillUnmount: =>
    @subscriptions.forEach(PubSub.unsubscribe);

  render: =>
    <div className='PageWrapper'>
      <Router history={history}>
        <div className='Nav'>
          <Nav user_id={@state.user_id} access_token={@state.access_token} />
        </div>
        <div className='Page'>
          <Routes user_id={@state.user_id} access_token={@state.access_token} />
        </div>
      </Router>
    </div>
