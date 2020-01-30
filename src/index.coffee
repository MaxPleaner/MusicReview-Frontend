import React, { Component } from 'react'

import ReactDOM from 'react-dom'
import { Layout } from "./Layout.coffee"

import 'bootstrap/dist/css/bootstrap.min.css';
import './style/App.css'

if module.hot
  ["App", "About"].forEach (component) ->
    module.hot.accept "./components/#{component}.coffee", () =>
      NextApp = require("./components/#{component}.coffee").default
      ReactDOM.render <NextApp />, document.getElementById('root')

ReactDOM.render((
  <Layout />
), document.getElementById('root'))

# ReactDOM.render <App />, document.getElementById 'root'
