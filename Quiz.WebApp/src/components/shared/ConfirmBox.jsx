import { useState, useEffect } from "react";
import { Alert, AlertTitle, Fade } from "@mui/material";

export default function ConfirmBox() {

  const [alertVisibility, setAlertVisibility] = useState(true);

  useEffect(() => {
    setTimeout(() => {
      setAlertVisibility(false);
    }, 3000);
  });

  return (
    <Fade in={alertVisibility} timeout={{ exit: 1000 }}>
      <Alert
        onClose={() => {
          setAlertVisibility(false);
        }}
        severity={props.severity}
        variant="filled"
        sx={{
          minWidth: 300,
          position: "absolute",
          zIndex: 100,
          bottom: 10,
          right: 10,
        }}
      >
        <AlertTitle>Warning</AlertTitle>
        {props.message}
      </Alert>
    </Fade>
  );
};