import React, { Component } from 'react'
import { Routes } from "./Routes.coffee"
import { Nav } from "./components/Nav.coffee"
import { BrowserRouter } from 'react-router-dom'

export class Layout extends Component
  constructor: ->
    super()

  render: ->
    <div className='PageWrapper'>
      <BrowserRouter>
        <div className='Nav'>
          <Nav />
        </div>
        <div className='Page'>
          <Routes />
        </div>
      </BrowserRouter>
    </div>
