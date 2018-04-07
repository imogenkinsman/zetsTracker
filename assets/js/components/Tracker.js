import React from 'react';
import Item from './Item';

import socket from '../socket';
import {items} from '../constants';

class Tracker extends React.Component {
  constructor(props) {
    super(props)
    this.state = {itemStates: {bombos: 0, shovel: 0, book: 0, boots: 0}}
  }

  clickHandler(name) {
    const {itemStates} = this.state
    itemStates[name] = itemStates[name] + 1
    console.log(itemStates)
    this.setState({itemStates: itemStates})
  }

  getCurrentState(name) {
    const index = this.state.itemStates[name]
    const item = items.filter((item) => item.name == name)[0]
    return item.states[index]
  }

  render() {
    return (
      <div className="row">
        <div className="col-sm">
          { items.map(({name}) =>
              <Item
                name={name}
                key={name}
                clickHandler={() => {this.clickHandler(name)}}
                currentState={this.getCurrentState(name)}
              />
            )
          }
        </div>
      </div>
    )
  }
}

export default Tracker;
