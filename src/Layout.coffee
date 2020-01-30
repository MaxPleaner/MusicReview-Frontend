import React, { Component } from 'react'
import { Routes } from "./Routes.coffee"
import { Nav } from "./components/Nav.coffee"
import { Router } from 'react-router-dom'
import history from './history.coffee';

export class Layout extends Component
  constructor: ->
    super()

  componentDidMount: =>
    @subscriptions = [

      PubSub.subscribe "logged in", (msg, {access_token, user_id}) =>
        localStorage.setItem "user_id", user_id
        localStorage.setItem "access_token", access_token
        history.push('/')

      PubSub.subscribe "logged out", =>
        localStorage.removeItem "user_id"
        localStorage.removeItem "access_token"
        history.push('/')
    ]

  componentWillUnmount: =>
    @subscriptions.forEach(PubSub.unsubscribe);

  render: ->
    <div className='PageWrapper'>
      <Router history={history}>
        <div className='Nav'>
          <Nav />
        </div>
        <div className='Page'>
          <Routes />
        </div>
      </Router>
    </div>
