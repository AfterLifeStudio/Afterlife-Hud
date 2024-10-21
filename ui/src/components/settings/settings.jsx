import { React, useEffect, useState } from "react";
import { createStyles } from "@mantine/emotion";
import Fade from "../../utils/fade";
import settingsicon from "../../assets/settings.png";
import Option from "./option";
import { NuiEvent } from "../../hooks/NuiEvent";
import { nuicallback } from "../../utils/nuicallback";

const styles = createStyles((theme) => ({
  settings: {
    position: "absolute",
    top: "2vw",
    left: "2vw",
  },
  map: {
    height: "30vw",
    backgroundColor: "rgba(0,0,0,0.5)",
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    width: "20vw",
  },
  top: {
    backgroundColor: "#D7D7D7",
    height: "2vw",
    width: "100%",
    display: "flex",
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
  },
  toptext: {
    display: "flex",
    flexDirection: "row",
    alignItems: "center",
    padding: "0px 5px 0px 5px",
    img: {
      width: "1.5vw",
    },
    p: {
      fontFamily: "Inter",
      fontSize: "1.5vw",
      fontWeight: "bold",
      color: "rgba(0,0,0,0.8)",
    },
  },
  bottom: {
    backgroundColor: "#D7D7D7",
    height: "1vw",
    width: "100%",
    fontFamily: "inter",
    fontWeight: "bold",
    textAlign: "end",
    fontSize: '.8vw'
  },

  catagory: {
    display: "flex",
    flexDirection: "column",
    width: "19vw",
    fontSize: "1vw",
    fontWeight: "400",
    fontFamily: "Jost",
    height: "fit-content",
  },

  catagorytitle: {
    background: "rgba(266,266,266,0.7)",
    color: "#676666",
    fontWeight: "bold",
    textTransform: "uppercase",
    textAlign: "center",
  },

  keybind: {
    display: "flex",
    flexDirection: "row",
    justifyContent: "end",
    paddingRight: "0.3vw",
    //backgroundColor: "rgba(0,0,0,0.5)",
    gap: "0.2vw",
      fontFamily: "inter",
      color: "#D7D7D7",
      fontSize: "1vw",
      textShadow: '0 0 5px black'
  },

  key: {
    fontWeight: "1000",
    borderRadius: "0.2vw",
    background: "#f93639",
    padding: "0 0.2vw 0 0.2vw",
    textShadow: 'none !important'
  },
}));

const Settings = () => {
  const { classes } = styles();
  const [visible, setVisible] = useState(true)
  const [settings, setSettings] = useState({
    show: true,
    showhud: true,
    cinemtic: false,
    showspeedometer: true,
    showplayerstatus: true,
    showminimap: true,
    speedunitmph: true,
  });

  const handlesettings = (data) => {
    console.log(data)
    setSettings(data);
    setVisible(true)
  };

  NuiEvent("settings", handlesettings);

  useEffect(() => {

    const handlekey = (e) => {
      if (visible && e.code == 'Escape') {
        setVisible(false)
        nuicallback("exitsettings")
      }
    };

    window.addEventListener('keydown',handlekey);
    return () => window.removeEventListener('keydown',handlekey);
  })

  return (
    <>
      <Fade in={visible}>
        <div className={classes.settings}>
          <div className={classes.top}>
            <div className={classes.toptext}>
              <img src={settingsicon} alt="" />
              <p>SETTINGS</p>
            </div>
          </div>
          <div className={classes.map}>
            <div className={classes.catagory}>
              <p className={classes.catagorytitle}>General</p>
              <Option
                title={"Toggle Hud"}
                value={settings.showhud}
                option1={"SHOW"}
                option2={"HIDE"}
                option={"showhud"}
              />
              <Option
                title={"Cinemtic Mode"}
                value={settings.cinemtic}
                option1={"SHOW"}
                option2={"HIDE"}
                option={"cinemtic"}
              />
            </div>
            <div className={classes.catagory}>
              <p className={classes.catagorytitle}>Speedometer</p>
              <Option
                title={"Toggle Speedometer"}
                value={settings.showspeedometer}
                option1={"SHOW"}
                option2={"HIDE"}
                option={"showspeedometer"}
              />
              <Option
                title={"Speed Unit"}
                value={settings.speedunitmph}
                option1={"MPH"}
                option2={"KMH"}
                option={"speedunitmph"}
              />
            </div>
            <div className={classes.catagory}>
              <p className={classes.catagorytitle}>Minimap</p>
              <Option
                title={"Toggle Minimap"}
                value={settings.showminimap}
                option1={"SHOW"}
                option2={"HIDE"}
                option={"showminimap"}
              />
            </div>
            <div className={classes.catagory}>
              <p className={classes.catagorytitle}>Player Status</p>
              <Option
                title={"Toggle Status"}
                value={settings.showplayerstatus}
                option1={"SHOW"}
                option2={"HIDE"}
                option={"showplayerstatus"}
              />
            </div>
          </div>
          <div className={classes.bottom}>@AfterLife Studios</div>
          <div className={classes.keybind}>
            <p className={classes.key}>ESC</p>
            <p>EXIT</p>
          </div>
        </div>
      </Fade>
    </>
  );
};

export default Settings;
