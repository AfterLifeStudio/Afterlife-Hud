import { React, useState } from "react";
import { createStyles } from "@mantine/emotion";
import Fade from "../../utils/fade";
const useStyles = createStyles((theme) => ({
    value: {
        position: 'absolute',
        transition: '200ms ease',
    },
}));

const Status = (data) => {
    const { classes } = useStyles();
    const val = 100 - data.value
    const visible = data.value > 0 ? true : false
  return (
    <>
    <Fade in={visible}>
      <div className={classes.status}>
        <img style={{width: data.size}} src={data.outlineimg} alt="" />
        <img style={{clipPath: `polygon(0 ${val}%, 100% ${val}%, 100% 100%, 0% 100%)`,width: data.size,marginTop: data.margin}} className={classes.value} src={data.valueimg} alt="" />
      </div>
      </Fade>
    </>
  );
};

export default Status;
