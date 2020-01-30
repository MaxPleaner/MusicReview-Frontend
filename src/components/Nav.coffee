import React, { Component, SetState } from 'react'
import { Nav as NavMenu, NavItem, NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';
import PubSub from 'pubsub-js';
import history from '../history.coffee';

export class Nav extends Component

  constructor: (props, context) ->
    super()
    @props = props

  build_nav_item = (link_text, href) =>
    <NavItem key={href}>
      <Link to={href}>
          {link_text}
      </Link>
    </NavItem>

  user_logged_in: =>
    @props.user_id && @props.access_token

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
