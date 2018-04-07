import React from 'react';
import Item from './Item';

import socket from '../socket';
import {items} from '../constants';

class Tracker extends React.Component {
  constructor(props) {
    super(props)
    this.state = {itemStates: this.initialItemStates()}
  }

  clickHandler(name) {
    const {itemStates} = this.state
    itemStates[name] = itemStates[name] + 1
    console.log(itemStates)
    this.setState({itemStates: itemStates})
  }

  getCurrentState(name) {
    const item = items.find((item) => item.name == name)
    const index = this.state.itemStates[name]
    return item.states[index]
  }

  initialItemStates() {
    const states = {}
    for (var item of items) {
      states[item.name] = 0
    }
    return states
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
