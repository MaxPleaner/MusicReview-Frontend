import React, { Component, SetState } from 'react'
import { Nav as NavMenu, NavItem, NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';

export class Nav extends Component

  constructor: ->
    super()

    @state =
      current_user: null

  build_nav_item = (link_text, href) =>
    <NavItem key={href}>
      <Link to={href}>
          {link_text}
      </Link>
    </NavItem>

  componentDidMount: =>
    @setState
      current_user: localStorage.getItem("current_user")

  render: =>
    auth_buttons = if @state.current_user
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
