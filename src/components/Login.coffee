import React, { useState, Component } from 'react'

export class Login extends Component
  # [name, set_name] = useState("")
  # [password, set_password] = useState("")

  constructor: ->
    super()
    @state =
      username: ""
      password: ""

  form_submit: =>
    debugger

  render: =>
    <div>
      <form
        className='CredentialsForm'
        onSubmit={@form_submit}
      >
        <input
          type='text'
          placeholder='username'
          onChange={(e) => @setState username: e.target.value}
          value={@state.username}
        />
        <input
          type='password'
          placeholder='password'
          onChange={(e) => @setState password: e.target.value}
          value={@state.password}
        />
        <input
          className='SubmitInput'
          type='submit'
          value='submit'
        />
      </form>
    </div>
