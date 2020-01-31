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
        <Route exact path='/' component={() => <Landing user={@props.user} />} />
        <Route exact path='/about' component={() => <About user={@props.user} />} />
        <Route exact path='/login' component={() => <Login user={@props.user} />} />
        <Route exact path='/logout' component={() => <Logout user={@props.user} />} />
        <Route exact path='/register' component={() => <Register user={@props.user} />} />
    </Switch>
