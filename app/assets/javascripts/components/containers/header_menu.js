import React from 'react'
import { connect } from 'react-redux'

import HeaderMenu from '../component/header_menus'
import { show } from '../action/show.js'

function mapStateToProps(state) {
  return state
}

function mapDispatchToProps(dispatch) {
  return {
    handleClick: () => { dispatch(show()) }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(HeaderMenu)