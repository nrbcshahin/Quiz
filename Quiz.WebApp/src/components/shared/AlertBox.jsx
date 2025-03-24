import { useState, useEffect } from "react";
import { Alert, AlertTitle, Fade } from "@mui/material";

export default function AlertBox({ severity, message }) {

  const [alertVisibility, setAlertVisibility] = useState(true);

  useEffect(() => {
    setTimeout(() => {
      setAlertVisibility(false);
    }, 2000);
  });

  return (
    <Fade in={alertVisibility} timeout={{ exit: 1000 }}>
      <Alert
        onClose={() => {
          setAlertVisibility(false);
        }}
        severity={severity}
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
        {message}
      </Alert>
    </Fade>
  );
};