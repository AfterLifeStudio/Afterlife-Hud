import { React, useState, useEffect } from "react";
import { createStyles } from "@mantine/emotion";
import Status from "./status";
import healthoutline from "../assets/healthoutline.png";
import healthvalue from "../assets/healthvalue.png";
import armoroutline from "../assets/armoroutline.png";
import armorvalue from "../assets/armorvalue.png";
import hungeroutline from "../assets/hungeroutline.png";
import hungervalue from "../assets/hungervalue.png";
import thirstoutline from "../assets/thirstoutline.png";
import thirstvalue from "../assets/thirstvalue.png";
const useStyles = createStyles((theme) => ({
  statuscontainer: {
    position: "absolute",
    bottom: "2vw",
    left: "3vw",
    display: "flex",
    flexDirection: "row",
    alignItems: "center",
    gap: 10,
  },
  line: {
    width: 2,
    height: 25,
    backgroundColor: "#D9D9D9",
  },
}));

const Playerstatus = () => {
  const [visible, setVisible] = useState(true);
  const [status, setStatus] = useState({
    health: 100,
    armour: 100,
    oxygen: 100,
    hunger: 100,
    thirst: 100,
  })

  const { classes } = useStyles();

  useEffect(() => {

    const handlemessage = (message) => {
      const action = message.data.action;
      const data = message.data.data;

      switch (action) {
        case "playerstatus":
          setStatus(data);
          console.log(data)
          break;
      }
    };

    window.addEventListener("message", handlemessage);
    return () => window.removeEventListener("message", handlemessage);
  });


  return (
    <>
      <div className={classes.statuscontainer}>
        <Status outlineimg={healthoutline} valueimg={healthvalue} value={status.health} />
        <Status outlineimg={armoroutline} valueimg={armorvalue} value={status.thirst} />
        <div className={classes.line}></div>
        <Status outlineimg={hungeroutline} valueimg={hungervalue} value={status.hunger} />
        <Status outlineimg={thirstoutline} valueimg={thirstvalue} value={status.thirst} />
      </div>
    </>
  );
};

export default Playerstatus;
