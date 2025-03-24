import {
  TextField,
  Box,
  Button,
  FormControlLabel,
  Checkbox,
} from "@mui/material";
import Grid from "@mui/material/Grid2"
import { useState } from "react";
import { postApi } from "../../services/Api";
import AlertBox from "../../components/shared/AlertBox";
import { setAuth } from "../../services/Storage";
import Nrbc from "../../assets/images/nrbc.png";
import Spinner from "../../components/shared/Spinner";
import { useForm } from "react-hook-form";
import { useNavigate } from "react-router-dom";


export default function Login() {

  const navigation = useNavigate();
  const { register, handleSubmit, formState: { errors } } = useForm();
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState();

  function onSubmit(data) {

    setLoading(true);

    postApi("auth/login", data).then((res) => {
      setLoading(false);
      if (res.success) {
        setAuth(res);
        navigation("/");
      } else {
        setMessage(res.message);
      }
    });
  }

  return (
    <Box
      sx={{
        backgroundColor: "#ffffff",
      }}
    >
      {
        loading && <Spinner />
      }

      {
        message && <AlertBox message={message} severity="warning" />
      }

      <Grid container>
        <Grid size={9}>
          <div className="login-left"></div>
        </Grid>
        <Grid size={3}>
          <form autoComplete="off" noValidate onSubmit={handleSubmit(onSubmit)}>
            <Box
              sx={{
                pt: 8,
                ml: 3,
                mr: 3,
              }}
            >
              <img src={Nrbc} alt="" className="logo" />
              <h2>Login</h2>
              <TextField
                fullWidth
                label="Mobile"
                size="small"
                variant="outlined"
                sx={{
                  mb: 2,
                  mt: 3,
                }}
                name="mobile"
                error={errors.userName}
                {...register("mobile", {
                  required: true,
                  minLength: 2,
                  maxLength: 50
                })}
              />
              <TextField
                fullWidth
                size="small"
                label="Password"
                type="password"
                variant="outlined"
                sx={{
                  mb: 2,
                }}
                name="password"
                error={errors.password}
                {...register("password", {
                  required: true,
                  minLength: 3,
                  maxLength: 50
                })}
              />
              <FormControlLabel
                control={<Checkbox value="remember" color="primary" />}
                label="Remember me"
              />
              <Button
                type="submit"
                variant="contained"
                size="large"
                fullWidth
                sx={{
                  mt: 5,
                }}
              >
                LOGIN
              </Button>
              <Button size="small" sx={{
                width: "100%",
                textTransform: "none",
                textAlign: "center",
                mt: 2
              }}>Forgot your password?</Button>
              <Box sx={{ fontSize: 15, mt: 2 }}>
                Don't have an account?
                <Button sx={{
                  textTransform: "none",
                }}>Registration</Button>
              </Box>
            </Box>
          </form>
        </Grid>
      </Grid>
    </Box>
  );
}