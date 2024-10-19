import { useState,useEffect } from "react";
import mapicon from "../assets/map.png"
import diricon from "../assets/diricon.png"
import { createStyles } from "@mantine/emotion";

const useStyles = createStyles((theme) => ({
    map: {
        backgroundColor: 'black',
        opacity: '20%',
        width: 203,
        height: 245
    },
    top: {
        backgroundColor: '#D7D7D7',
        height: 15,
        width: '100%',
        display: 'flex',
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
    },
    bottom: {
        backgroundColor: '#D7D7D7',
        height: 10,
        width: '100%',
    },
    location: {
        display: 'flex',
        flexDirection: 'row',
        alignItems: 'center',
        padding: '0px 5px 0px 5px',
        gap: 2,
        'p': {
            fontFamily: "Inter",
            fontSize: 10,
            fontWeight: 'bold',
            color: '#676666',
        }
    }
}));

const Minimap = () => {
    const [visible, setVisible] = useState(true);
    const [compass,setCompass] = useState([])
    const [minimap,setMinimap] = useState([])
    const { classes } = useStyles();

    useEffect(() => {

        const handlemessage = (message) => {
          const action = message.data.action;
          const data = message.data.data;

          switch (action) {
            case "compass":
                setCompass(data);
              break;
            case "minimap":
                setMinimap(data)
              break;
          }
        };
    
        window.addEventListener("message", handlemessage);
        return () => window.removeEventListener("message", handlemessage);
      });
    
    

    return (
        <>
        <div className={classes.minimap}>
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

            <div style={{width: minimap.width+'px',height: minimap.height+'px'}} className={classes.map}></div>
            <div className={classes.bottom}></div>
        </div>
        </>
    )
}

export default Minimap