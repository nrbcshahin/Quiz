import { Backdrop, Box } from "@mui/material";
import CircularProgress from "@mui/material/CircularProgress";

export default function Spinner() {
  return (
    <Backdrop
      sx={{
        color: "#f4f4f4",
        zIndex: (theme) => theme.zIndex.modal + 1,
      }}
      open={true}
    >
      <Box>
        <CircularProgress
          thickness={4}
          color="inherit"
          size="3.5rem"
          value={80}
        />
        <Box sx={{
          fontSize: 16,
          mt: 2
        }}>
          Loading ...
        </Box>
      </Box>
    </Backdrop>
  );
}