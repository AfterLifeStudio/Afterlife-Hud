import { useState, useEffect } from "react";
import Fade from "../utils/fade";
import mapicon from "../assets/map.png";
import diricon from "../assets/diricon.png";
import { createStyles } from "@mantine/emotion";
import { NuiEvent } from "../hooks/NuiEvent";
import circlemap from "../assets/circlemap.png";
const useStyles = createStyles((theme) => ({
  circlemap: {
    width: 250,
    transition: "0.1s ease",
  },
  map: {
    backgroundColor: "black",
    opacity: "20%",
  },
  top: {
    backgroundColor: "#D7D7D7",
    height: 20,
    width: "100%",
    display: "flex",
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
  },
  bottom: {
    backgroundColor: "#D7D7D7",
    height: 10,
    width: "100%",
  },
  location: {
    display: "flex",
    flexDirection: "row",
    alignItems: "center",
    padding: "0px 5px 0px 5px",
    gap: 2,
    p: {
      fontFamily: "Inter",
      fontSize: 10,
      fontWeight: "bold",
      color: "#676666",
    },
  },
}));

const Minimap = () => {
  const [compass, setCompass] = useState({
    show: true,
    circlemap: false,
    width: 203,
    height: 245,
    streetname: "Los Santos",
    heading: 20,
    direction: "NW",
  });

  const { classes } = useStyles();

  const handleCompass = (data) => {
    setCompass(data);
  };

  NuiEvent("compass", handleCompass);

  return (
    <>
      <Fade in={compass.show}>
        {compass.circlemap ? (
          <img
            style={{
              width: compass.width + "px",
              height: 'auto',
              transform: `rotate(${compass.heading}deg)`,
            }}
            className={classes.circlemap}
            src={circlemap}
            alt=""
          />
        ) : (
          <div style={{marginBottom: '1vw',marginRight: '1.3vw'}} className={classes.minimap}>
            <div className={classes.top}>
              <div className={classes.location}>
                <img src={diricon} alt="" />
                <p>{compass.direction}</p>
              </div>
              <div className={classes.location}>
                <p>{compass.streetname}</p>
                <img src={mapicon} alt="" />
              </div>
            </div>

            <div
              style={{
                width: compass.width + "px",
                height: compass.height + "px",
              }}
              className={classes.map}
            ></div>
            <div className={classes.bottom}></div>
          </div>
        )}
      </Fade>
    </>
  );
};

export default Minimap;
