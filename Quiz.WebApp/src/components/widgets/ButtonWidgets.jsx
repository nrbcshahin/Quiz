import { Button } from "@mui/material";
import { SdCard, Cancel, SkipPrevious, Search, AddCircle, Download, DataUsage } from '@mui/icons-material';
import { Link } from "react-router-dom";


function BtnSubmit() {
    return (
        <Button
            variant="contained"
            startIcon={<SdCard />}
            color="primary"
            type="submit">
            Submit
        </Button>
    );
}

function BtnReset({ onClick }) {
    return (
        <Button
            variant="contained"
            color="error"
            type="button"
            startIcon={<Cancel />}
            onClick={onClick}
        >
            Reset
        </Button>
    );
}

function BtnBack({ url }) {
    return (
        <Button
            variant="outlined"
            component={Link}
            to={url}
            size="medium"
            color="primary"
            startIcon={<SkipPrevious />}
        >
            Back To List
        </Button>
    );
}

function BtnSearch({ onClick }) {
    return (
        <Button size='medium'
            variant="outlined"
            onClick={onClick}
            startIcon={<Search />}
        >
            Search
        </Button>
    );
}

function BtnClear({ onClick }) {
    return (
        <Button variant="outlined"
            color="error"
            startIcon={<Cancel />}
            onClick={onClick}
            sx={{
                ml: 1,
            }}>Clear</Button>
    );
}

function BtnCreate({ url }) {
    return (
        <Button
            variant="outlined"
            size="medium"
            component={Link}
            startIcon={<AddCircle />}
            to={url}
        >
            Create
        </Button>
    );
}

function BtnExport({ onClick }) {
    return (
        <Button variant="contained"
            color="primary"
            type="button"
            startIcon={<Download />}
            onClick={onClick}
            sx={{
                ml: 1,
            }}>Export</Button>
    );
}


function BtnGenerate({ onClick }) {
    return (
        <Button variant="contained"
            color="primary"
            type="button"
            startIcon={<DataUsage />}
            onClick={onClick}
            sx={{
                ml: 1,
            }}>Generate</Button>
    );
}

export { BtnSubmit, BtnReset, BtnBack, BtnSearch, BtnClear, BtnCreate, BtnExport, BtnGenerate }