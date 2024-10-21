import { React, useState, useEffect } from "react";
import { createStyles } from "@mantine/emotion";
import Fade from "../../utils/fade";
import Status from "./status";
import Mic from "./mic";
import healthoutline from "../../assets/healthoutline.png";
import healthvalue from "../../assets/healthvalue.png";
import armoroutline from "../../assets/armoroutline.png";
import armorvalue from "../../assets/armorvalue.png";
import hungeroutline from "../../assets/hungeroutline.png";
import hungervalue from "../../assets/hungervalue.png";
import thirstoutline from "../../assets/thirstoutline.png";
import thirstvalue from "../../assets/thirstvalue.png";
import { NuiEvent } from "../../hooks/NuiEvent";

const useStyles = createStyles((theme) => ({
  statuscontainer: {
    position: "absolute",
    bottom: "2vw",
    left: "3vw",
    display: "flex",
    flexDirection: "row",
    alignItems: "center",
    gap: 10,
    padding: 6,
    div: {
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
      gap: 3,
    },
  },
  line: {
    width: 2,
    height: 25,
    backgroundColor: "#D9D9D9",
  },
}));

const Playerstatus = () => {
  const [status, setStatus] = useState({
    show: true,
    health: 100,
    armour: 100,
    oxygen: 100,
    voice: false,
    voicemode: 2,
    hunger: 100,
    thirst: 100,
  });

  const { classes } = useStyles();

  const handleplayerstatus = (data) => {
    setStatus(data);
  }

  NuiEvent("playerstatus", handleplayerstatus)

  return (
    <>
      <Fade in={status.show}>
        <div className={classes.statuscontainer}>
          <div>
            <Status
              outlineimg={healthoutline}
              valueimg={healthvalue}
              value={status.health}
              size={40}
            />
            <Status
              outlineimg={armoroutline}
              valueimg={armorvalue}
              value={status.armour}
              size={40}
            />
          </div>
          <div className={classes.line}></div>
          <div>
            <Mic size={40} voice={status.voice} voicemode={status.voicemode} />
            <Status
              outlineimg={hungeroutline}
              valueimg={hungervalue}
              value={status.hunger}
              size={40}
            />
            <Status
              outlineimg={thirstoutline}
              valueimg={thirstvalue}
              value={status.thirst}
              size={40}
            />
          </div>
        </div>
      </Fade>
    </>
  );
};

export default Playerstatus;
