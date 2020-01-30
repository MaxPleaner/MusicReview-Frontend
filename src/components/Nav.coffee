import React, { Component, SetState } from 'react'
import { Nav as NavMenu, NavItem, NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';
import PubSub from 'pubsub-js';
import history from '../history.coffee';

export class Nav extends Component

  componentWillUnmount: =>
    @subscriptions.forEach(PubSub.unsubscribe)

  constructor: (props, context) ->
    super()

    @state =
      user_id: null
      access_token: null

  build_nav_item = (link_text, href) =>
    <NavItem key={href}>
      <Link to={href}>
          {link_text}
      </Link>
    </NavItem>

  componentDidMount: =>
    @subscriptions = [

      PubSub.subscribe "logged in", (msg, {access_token, user_id}) =>
        @setState
          user_id: user_id
          access_token: access_token

      PubSub.subscribe "logged out", =>
        @setState
          user_id: null
          access_token: null
    ]

    @setState
      user_id: localStorage.getItem("user_id")
      access_token: localStorage.getItem("access_token")

  user_logged_in: =>
    @state.user_id && @state.access_token

  render: =>
    auth_buttons = if @user_logged_in()
      [build_nav_item("Logout", "/logout")]
    else
      [
        build_nav_item("Login", "/login"),
        build_nav_item("Register", "/register"),
      ]

    <NavMenu>
      <div className='NavItems'>
        {build_nav_item("Home", "/")}
        {auth_buttons}
        {build_nav_item("About", "/about")}
      </div>
    </NavMenu>
