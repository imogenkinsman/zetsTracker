import React from 'react';
import Item from './Item';

class Tracker extends React.Component {
  constructor(props) {
    super(props)
    this.state = {itemStates: {bombos: 0, shovel: 0, book: 0, boots: 0}}
  }

  clickHandler(name) {
    const {itemStates} = this.state
    itemStates[name] = itemsStates[name] + 1
    this.setState({itemStates: itemStates})
  }

  getCurrentState(name) {
    const index = this.state.itemStates[name]
    const item = items.filter((item) => item.name == name)
    return item.states[index]
  }

  render() {
    const items = [
      {name: 'bombos', states: ["inactive", "active"]},
      {name: 'shovel', states: ["inactive", "active"]},
      {name: 'book', states: ["inactive", "active"]},
      {name: 'boots', states: ["inactive", "active"]},
    ]

    return (
      <div className="row">
        <div className="col-sm">
          { items.map(({name}) =>
              <Item
                name={name}
                key={name}
                clickHandler={this.clickHandler(name)}
                currentState={getCurrentState(name)}
              />
            )
          }
        </div>
      </div>
    )
  }
}

export default Tracker;
