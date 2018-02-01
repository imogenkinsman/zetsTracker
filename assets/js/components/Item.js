import React from 'react';

class Item extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const {name} = this.props

    return (
      <img src={`/images/${name}.png`}></img>
    )
  }
}

export default Item;
