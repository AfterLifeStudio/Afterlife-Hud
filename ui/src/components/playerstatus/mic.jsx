import { React, useState } from "react";
import mic from '../../assets/mic.png';
import miclow from '../../assets/miclow.png';
import micmed from '../../assets/micmed.png';
import michigh from '../../assets/michigh.png';


const Mic = (data) => {

  const mode = data.voicemode == 1 ? miclow : data.voicemode == 2 ? micmed : michigh

  return (
    <>
      <div>
        <img style={{width: data.size}} src={data.voice ? mode : mic} alt="" />
      </div>
    </>
  );
};

export default Mic;
