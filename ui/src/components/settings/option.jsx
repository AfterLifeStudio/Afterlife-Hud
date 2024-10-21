import { React, useState } from "react";
import { createStyles } from "@mantine/emotion";
import { nuicallback } from "../../utils/nuicallback";

const styles = createStyles((theme) => ({

  option: {
    height: '1.8vw',
    display: "flex",
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    padding: '0 5px 0 5px',
    position: "relative",
    bottom: "0.5vw",
    '&:hover': {
      background: 'rgba(0,0,0,0.7)',
    },
    'p': {
      fontFamily: "inter",
      color: "white",
      textTransform: "uppercase",
      fontWeight: '400',
      fontSize: "0.8vw",
    },
  },
  input: {
    display: "flex",
    flexDirection: "row",
    gap: "0.5vw",

    'p': {
      "&:hover": {
        cursor: "pointer",
      },
    },
  },
}));

const Option = (data) => {
  const { classes } = styles();
  
  const [input, setinput] = useState(data.value);

  const handleinput = (input,option) => {
    setinput(input)
    nuicallback("settings",{option,input})
  };

  return (
    <>
      <div className={classes.option}>
        <p>{data.title}</p>
        <div className={classes.input}>
          <p
            onClick={() => handleinput(true,data.option)}
            style={{ opacity: input == true ? "100%" : "50%" }}
          >
            {data.option1}
          </p>
          <p
            onClick={() => handleinput(false,data.option)}
            style={{ opacity: input == false ? "100%" : "50%" }}
          >
           {data.option2}
          </p>
        </div>
      </div>
    </>
  );
};

export default Option;
