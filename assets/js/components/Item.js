import React from 'react';
import PropTypes from 'prop-types'

class Item extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const {name} = this.props
    const bgName = `bg-${name}`

    return (
      <div className={bgName}></div>
    )
  }
}

Item.propTypes = {
  name: PropTypes.string,
  currentState: PropTypes.string,
  clickHandler: PropTypes.func
}

export default Item;
