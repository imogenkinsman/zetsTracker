import React from 'react';
import Item from './Item';

class Tracker extends React.Component {
  clickHandler(key) {

  }

  render() {
    return (
      <div className="row">
        <Item name="firerod" clickHandler={this.clickHandler("firerod")}/>
      </div>
    )
  }
}

export default Tracker;
