import { SentimentDissatisfied } from "@mui/icons-material";
import { Box } from "@mui/system";

export default function Error() {
  return (
    <div className="container">
      <Box className="eror-page">
        <SentimentDissatisfied sx={{ fontSize: 180 }} />
        <h1>404</h1>
        <h2>Page not found !</h2>
        <p>The page you are looking for doesn't exist or other error occured</p>
      </Box>
    </div>
  );
};