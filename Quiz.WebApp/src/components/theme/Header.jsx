import React from "react";
import {
  AppBar,
  Toolbar,
  Box,
  IconButton,
  Badge,
  Typography,
} from "@mui/material";
import {
  Mail,
  Notifications,
  Settings,
  SettingsPowerTwoTone,
  Adb,
} from "@mui/icons-material";
import { useNavigate } from "react-router-dom";
import { clearAuth } from "../../services/Storage";

export default function Header() {
  const navigate = useNavigate();

  function btnLogout() {
    clearAuth();
    navigate("/login");
  };

  return (
    <div className="container">
      <AppBar
        position="static"
        sx={{ backgroundColor: "transparent" }}
        elevation={0}
      >
        <Toolbar variant="dense">
          <Adb sx={{ mr: 1, ml: -3 }} />
          <Typography
            variant="h6"
            sx={{
              fontFamily: "monospace",
              fontWeight: 800,
              fontSize: 20,
              letterSpacing: ".1rem",
              color: "inherit",
            }}
          >
            REPORTS
          </Typography>
          <Box sx={{ flexGrow: 1 }} />
          <Box>
            <IconButton size="large" edge="end" color="inherit">
              <Badge badgeContent={4} color="warning">
                <Mail fontSize="small" />
              </Badge>
            </IconButton>
            <IconButton size="large" edge="end" color="inherit" sx={{ ml: 2 }}>
              <Badge badgeContent={17} color="info">
                <Notifications fontSize="small" />
              </Badge>
            </IconButton>
            <IconButton size="large" edge="end" color="inherit" sx={{ ml: 2 }}>
              <Settings fontSize="medium" />
            </IconButton>
            <IconButton
              onClick={btnLogout}
              size="large"
              edge="end"
              color="inherit"
              sx={{ ml: 1.5 }}
            >
              <SettingsPowerTwoTone fontSize="medium" />
            </IconButton>
          </Box>
        </Toolbar>
      </AppBar>
    </div>
  );
};
