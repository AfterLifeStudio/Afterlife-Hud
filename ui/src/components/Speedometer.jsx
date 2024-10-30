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
            textShadow: '0 0 5px black'
        }
    },
    speeddigit: {
        position: 'relative',
        bottom: 35,
        right: 5,
        width: 75,
        textShadow: '0 0 5px black'
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
        textShadow: '0 0 5px black'
    },
}));

const Speedometer = () => {
    const [vehicle,setVehicle] = useState({
      show: true,
      speed: 50,
      fuel: 50,
      seatbelt: true,
    })

    const { classes } = useStyles();

    const handlespeedometer = (data) => {
      setVehicle(data)
    }

    NuiEvent("speedometer", handlespeedometer)


    return (
      <>
        <Fade in={vehicle.show}>
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
              <p>{vehicle.unit ? "MPH" : "KMH"}</p>
              <div className={classes.speeddigit}>
                {vehicle.speed < 10 ? (
                  <>
                    <span style={{opacity: '50%'}}>0</span>
                    <span style={{opacity: '50%'}}>0</span>
                    <span>{vehicle.speed}</span>
                  </>
                ) : vehicle.speed < 100 ? (
                  <>
                    <span style={{opacity: '50%'}}>0</span>
                    <span>{vehicle.speed}</span>
                  </>
                ) : (
                  <span>{vehicle.speed}</span>
                )}
              </div>
            </div>
          </div>
        </Fade>
      </>
    );
}

export default Speedometer