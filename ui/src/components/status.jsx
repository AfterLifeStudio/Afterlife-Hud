import { React, useState } from "react";
import { createStyles } from "@mantine/emotion";

const useStyles = createStyles((theme) => ({
    status: {
        'img': {
            width: 45,
        }
    },
    value: {
        position: 'absolute',
        marginLeft: -45,
        transition: '200ms ease'
    },
}));

const Status = (data) => {
    const { classes } = useStyles();
    const val = 100 - data.value

  return (
    <>
      <div className={classes.status}>
        <img src={data.outlineimg} alt="" />
        <img style={{clipPath: `polygon(0 ${val}%, 100% ${val}%, 100% 100%, 0% 100%)`}} className={classes.value} src={data.valueimg} alt="" />
      </div>
    </>
  );
};

export default Status;
