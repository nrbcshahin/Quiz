import { IconButton } from "@mui/material";
import { Edit } from '@mui/icons-material';


function IcnEdit({ onClick }) {
    return (
        <IconButton
            onClick={onClick}
            color="primary">
            <Edit />
        </IconButton>
    );
}

export { IcnEdit }