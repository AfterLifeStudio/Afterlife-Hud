import { React, useState, useEffect } from "react";
import Fade from "../utils/fade";
import { createStyles } from "@mantine/emotion";
import Minimap from "./Minimap";
import Speedometer from "./Speedometer";
import Playerstatus from "./playerstatus/Playerstatus";
import Settings from "./settings/settings";
import { NuiEvent } from "../hooks/NuiEvent";

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

  const handlevisible = (data) => {
    setVisible(data);
  }
  NuiEvent("visible", handlevisible)


  return (
    <>
      <Settings/>
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
