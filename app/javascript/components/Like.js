import React from "react"
class Like extends React.Component {
   constructor(props){

    super(props);
    this.state = {
      like: 124,
      updated: false
    };

  }

  updateLike = () => {

    if(!this.state.updated) {
      this.setState((prevState, props) => {
        return {
          like: prevState.like + 1,
          updated: true
        };
      });

    } else {

      this.setState((prevState, props) => {
        return {
          like: prevState.like - 1,
          updated: false
        };
      });

    }
  }

  render(){

    return(
      <div>
        <p onClick={this.updateLike}>Like</p>
        <p>{this.state.like}</p>
      </div>
    );
  }
}

export default Like;