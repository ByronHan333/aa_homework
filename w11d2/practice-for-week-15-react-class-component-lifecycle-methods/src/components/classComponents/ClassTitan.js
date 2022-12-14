import { Component } from 'react';

import titanChill from '../../assets/titan_chill.jpg';
import titanHungry from '../../assets/titan_hungry.MOV';

class ClassTitan extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isHungry: true,
      isLunchTime: false
    };
  }

  componentDidMount() {
    this.lunchTimeout = setTimeout(() => {
      this.setState({ isLunchTime: true });
    }, 7000);
  }

  componentWillUnmount() {
    clearTimeout(this.lunchTimeout);
  }
  
  render() {
    const { isLunchTime, isHungry } = this.state;
    const mood = (isLunchTime && isHungry) ? 'MAD' : 'CHILL';

    const hungryRender = isHungry
      ? (
        <h1>If You Don't Feed Titan Soon, He Will Get Mad!</h1>
      ) : (
        <h1>Yum! That's better!</h1>
      );

    const moodRender = mood === 'CHILL'
      ? (
        <div className='titan-chill'>
          <img width=' 690' height=' 390' src={titanChill} alt='titan' />
          {isHungry && (
            <div className='button-holder'>
              <button
                className='mover t-button'
                onClick={() => this.setState({ isHungry: false })}
              >
                Click to Feed Titan! LOL!
              </button>
            </div>
          )}
        </div>
      ) : (
        <>
          <video width='690px' height='390px' controls autoPlay muted>
            <source src={titanHungry} type='video/mp4' />
          </video>
          <br />
          <button
            className='f-button'
            onClick={() => this.setState({ isHungry: false })}
          >
            Feed Titan
          </button>
        </>
      );

    return (
      <>
        <div className='titan-container'>
          {hungryRender}
          <h2> Current mood: {mood} </h2>
          {moodRender}
        </div>
      </>
    );
  }
}

export default ClassTitan;