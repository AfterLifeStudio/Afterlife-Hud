import { useState, useEffect } from "react";
import { createStyles } from "@mantine/emotion";
import fuel from "../assets/fuel.png";
import seatbelt from "../assets/seatbelt.png";
import Fade from "../utils/fade";
import { NuiEvent } from "../hooks/NuiEvent";

const useStyles = createStyles((theme) => ({
    speedometer: {
        display: 'flex',
        flexDirection: 'row',
        alignItems: 'center',
        gap: 15,
        fontFamily: 'Jost',
        color: '#FFFFFF',
        position: 'relative',
        top: 20,
        right: 10
    },
    speed: {
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'end',
        fontWeight: 250,
        fontSize: 50,
        height: 100,
        position: 'relative',
        bottom: 25,
        'p':{
            fontSize: 20,
            opacity: '50%',
        }
    },
    speeddigit: {
        position: 'relative',
        bottom: 35,
        left: 5,
    },
    line: {
        width: 2,
        height: 25,
        backgroundColor: '#D9D9D9'
    },
    fuel: {
        display: 'flex',
        flexDirection: 'row',
        alignItems: 'center',
        gap: 4,
    },
}));

const Speedometer = () => {
    const [visible, setVisible] = useState(false);
    const [vehicle,setVehicle] = useState({
      speed: 50,
      fuel: 50,
      seatbelt: false,
    })

    const { classes } = useStyles();

    const handlevisible = (data) => {
      setVisible(data)
    }

    const handlespeedometer = (data) => {
      setVehicle(data)
    }

    NuiEvent("speedvisible", handlevisible)
    NuiEvent("speedometer", handlespeedometer)

    return (
      <>
     <Fade in={visible}>
        <div className={classes.speedometer}>
        <Fade in={vehicle.seatbelt}>
        <img src={seatbelt} alt="" />
        </Fade>
          <div className={classes.fuel}>
            <img src={fuel} alt="" />
            <p>{vehicle.fuel}</p>
          </div>
          <div className={classes.line}></div>
          <div className={classes.speed}>
            <p>{vehicle.unit}</p>
            <div className={classes.speeddigit}>{vehicle.speed}</div>
          </div>
        </div>
        </Fade>
      </>
    );
}

export default Speedometer