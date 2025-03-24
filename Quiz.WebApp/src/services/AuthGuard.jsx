import React from "react";
import { Navigate, useLocation } from "react-router-dom";
import { getToken } from "./Storage";

const AuthGuard = ({ children }) => {
  
  let location = useLocation();
  if (getToken() == null) {
    return <Navigate to="/login" state={{ from: location }} replace />;
  }
  return children;
};

export default AuthGuard;
