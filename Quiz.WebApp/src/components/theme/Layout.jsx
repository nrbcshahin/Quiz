import { Outlet } from "react-router-dom";
import Grid from "@mui/material/Grid2";
import Header from "./Header";
import TopMenu from "./TopMenu";

export default function Layout() {
  return (
    <div>
      <Grid container>
        <Grid size={12} className="header">
          <Header />
        </Grid>
        <Grid size={12} sx={{ backgroundColor: "#006203" }}>
          <TopMenu />
        </Grid>
        <Grid size={12} sx={{ backgroundColor: "#f2f2f2" }}>
          <div className="layout">
            <Outlet />
          </div>
        </Grid>
      </Grid>
    </div>
  );
}