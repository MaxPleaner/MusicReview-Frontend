import React, { Component } from 'react'
import { Switch, Route } from 'react-router-dom'
import { Landing } from './components/Landing.coffee'
import { About } from "./components/About.coffee"
import { Login } from "./components/Login.coffee"
import { Logout } from "./components/Logout.coffee"
import { Register } from "./components/Register.coffee"

export class Routes extends Component
  constructor: (props) ->
    super()
    @props = props

  render: =>
    <Switch>
        <Route
          exact path='/'
          component={
            () => <Landing
              user_id={@props.user_id}
              access_token={@props.access_token}
            />
          }
        />
        <Route
          exact path='/about'
          component={
            () => <About
              user_id={@props.user_id}
              access_token={@props.access_token}
            />
          }
        />
        <Route
          exact path='/login'
          component={
            () => <Login
              user_id={@props.user_id}
              access_token={@props.access_token}
            />
          }
        />
        <Route
          exact path='/logout'
          component={
            () => <Logout
              user_id={@props.user_id}
              access_token={@props.access_token}
            />
          }
        />
        <Route
          exact path='/register'
          component={
            () => <Register
              user_id={@props.user_id}
              access_token={@props.access_token}
            />
          }
        />
    </Switch>
