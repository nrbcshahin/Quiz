import { Route } from "react-router-dom";
import Welcome from "../modules/Dashboard/Welcome";
import AuthGuard from "../services/AuthGuard";

const Dashboard = [
    <Route
        key="welcome"
        path="/"
        element={<AuthGuard>
            <Welcome />
        </AuthGuard>}
        exact={true}
    />
];

export default Dashboard;