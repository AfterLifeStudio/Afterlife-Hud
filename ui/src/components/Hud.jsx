import { React, useState, useEffect } from "react";
import Fade from "../utils/fade";
import { createStyles } from "@mantine/emotion";
import Minimap from "./Minimap";
import Speedometer from "./Speedometer";
import Playerstatus from "./Playerstatus"
const useStyles = createStyles((theme) => ({
  vehicle: {
    position: 'absolute',
    bottom: '2vw',
    right: '3vw',
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'end',
    gap: 5,
  }
}));
               
const Hud = () => {
  const [visible, setVisible] = useState(true);
  const { classes } = useStyles();

  useEffect(() => {

    const handlemessage = (message) => {
      const action = message.data.action;
      const data = message.data.data;

      switch (action) {
        case "visible":
            setVisible(data);
          break;
      }
    };

    window.addEventListener("message", handlemessage);
    return () => window.removeEventListener("message", handlemessage);
  });

  return (
    <>
      <Fade in={visible}>
        <Playerstatus />
        <div className={classes.vehicle}>
          <Speedometer />
          <Minimap />
        </div>
      </Fade>
    </>
  );
};

export default Hud;
