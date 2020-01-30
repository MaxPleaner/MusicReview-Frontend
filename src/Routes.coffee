import React, { Component } from 'react'
import { Switch, Route } from 'react-router-dom'
import { Landing } from './components/Landing.coffee'
import { About } from "./components/About.coffee"
import { Login } from "./components/Login.coffee"
import { Register } from "./components/Register.coffee"

export class Routes extends Component
  constructor: ->
    super()

  render: ->
    <Switch>
        <Route exact path='/' component={Landing} />
        <Route exact path='/about' component={About} />
        <Route exact path='/login' component={Login} />
        <Route exact path='/register' component={Register} />
    </Switch>
