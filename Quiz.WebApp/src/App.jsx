import "./assets/styles/theme.css";
import "./assets/styles/main.css";
import "./assets/styles/menu.css";

import React from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";

import Error from "./components/theme/Error";
import Layout from "./components/theme/Layout";
import { ThemeProvider } from "@mui/material/styles";
import Theme from "./helpers/Theme";
import Login from "./modules/Shared/Login";
import AuthGuard from "./services/AuthGuard";
import Dashboard from "./routes/Dashboard";
import Shared from "./routes/Shared";
import Account from "./routes/Account";


function App() {
  return (<ThemeProvider theme={Theme}>
    <BrowserRouter
      future={{
        v7_relativeSplatPath: true,
        v7_startTransition: true,
      }}>
      <Routes key="main">
        <Route
          key="login"
          path="/login"
          element={<Login />}
          exact={true} />
        <Route
          key="layout"
          element={
            <AuthGuard>
              <Layout />
            </AuthGuard>
          }
        >
          {Shared}
          {Dashboard}
          {Account}
          <Route key="error" path="*" element={<Error />} />
        </Route>
      </Routes>
    </BrowserRouter>
  </ThemeProvider>);
}

export default App;
