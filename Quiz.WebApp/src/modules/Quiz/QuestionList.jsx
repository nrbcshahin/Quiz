import { DataGrid } from "@mui/x-data-grid";
import { useEffect, useState } from "react";
import AlertBox from "../../components/shared/AlertBox";
import Spinner from "../../components/shared/Spinner";
import { Box, Card, CardContent, CardHeader, Divider, TextField } from "@mui/material";
import Grid from "@mui/material/Grid2";
import { BtnCreate } from "../../components/widgets/ButtonWidgets";
import { postApi } from "../../services/Api";


export default function QuestionList() {
    const [questions, setQuestions] = useState([]);
    const [message, setMessage] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        getQuestions();
    }, []);

    const columns = [
        { field: 'title', headerName: 'Title', width: 100 },
        { field: 'summary', headerName: 'Summary', width: 100 },
        { field: 'isActive', headerName: 'Is Active', width: 10 },
        { field: 'createdDate', headerName: 'Created', width: 100 }
    ];

    function getQuestions() {
        postApi("question/question-list").then(res => {
            setLoading(false);
            if (!res.success) {
                setMessage(res.message);
                return;
            }
            setQuestions(res.questions);
        });
    }

    return (
        <div className="container">
            {message != null && (
                <AlertBox severity="warning" message={message} />
            )}
            {loading && <Spinner />}
            <Card variant="outlined">
                <CardHeader
                    title="Bundle List"
                    action={
                        <BtnCreate url='/quiz//new-bundle' />
                    }
                />
                <Divider />
                <CardContent>
                    <Grid container spacing={2} sx={{ p: 1 }}>
                        <Grid item xs={3}>
                            <TextField
                                label="ss" size="small" />
                        </Grid>
                        <Grid item xs={3}>

                        </Grid>
                        <Grid item xs={6}>
                            <Box display="flex" justifyContent="flex-end">
                            </Box>
                        </Grid>
                    </Grid>
                    <DataGrid
                        rows={questions}
                        columns={columns}
                        getRowId={r => r.questionId}
                        headerHeight={35}
                        rowHeight={35}
                    
                        rowsPerPageOptions={[20, 50, 100]}
                        initialState={{
                            pagination: {
                                paginationModel: { page: 0, pageSize: 5 },
                            },
                        }}
                        pageSizeOptions={[5, 10]}
                        checkboxSelection
                    />

                </CardContent>
            </Card>
        </div>
    );
}