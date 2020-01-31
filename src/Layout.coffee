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

      PubSub.subscribe "logged in", (msg, user) =>
        localStorage.setItem "user", JSON.stringify(user)
        @setState { user }
        history.push('/')

      PubSub.subscribe "logged out", =>
        localStorage.removeItem "user"
        @setState { user: null }
        history.push('/')
    ]

    @setState
      user: JSON.parse(localStorage.getItem("user"))

  componentWillUnmount: =>
    @subscriptions.forEach(PubSub.unsubscribe);

  render: =>
    <div className='PageWrapper'>
      <Router history={history}>
        <div className='Nav'>
          <Nav user={@state.user} />
        </div>
        <div className='Page'>
          <Routes user={@state.user} />
        </div>
      </Router>
    </div>
