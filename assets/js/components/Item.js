import React from 'react';
import PropTypes from 'prop-types'

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

Item.propTypes = {
  name: PropTypes.string,
  clickHandler: PropTypes.func
}

export default Item;
