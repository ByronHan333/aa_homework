import { useState, useEffect } from 'react';

import titanChill from '../../assets/titan_chill.jpg';
import titanHungry from '../../assets/titan_hungry.MOV';

const FunctionTitan = () => {
  const [isHungry, setIsHungry] = useState(true);
  const [isLunchTime, setIsLunchTime] = useState(false);
  const mood = (isLunchTime && isHungry) ? 'MAD' : 'CHILL';

  useEffect(() => {
    const timeout = setTimeout(() => setIsLunchTime(true), 7000);
    return () => clearTimeout(timeout);
  }, []);

  const hungerRender = isHungry
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
              onClick={() => setIsHungry(false)}
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
          onClick={() => setIsHungry(false)}
        >
          Feed Titan
        </button>
      </>
    );

  return (
    <>
      <div className='titan-container'>
        {hungerRender}
        <h2> Current mood: {mood} </h2>
        {moodRender}
      </div>
    </>
  );
};

export default FunctionTitan;
