import React from 'react'

export default class HeaderMenu extends React.Component {
  render() {
    return <div>
      <button className={"setting-button"} onClick={ () => this.props.handleClick() }>設定</button>
    </div>
  }
}