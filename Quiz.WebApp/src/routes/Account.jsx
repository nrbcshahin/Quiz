import { Route } from "react-router-dom";
import AuthGuard from "../services/AuthGuard";
import QuestionList from "../modules/Quiz/QuestionList";


const Account = [
    <Route path="question">
        <Route
            key="question-list"
            path="question-list"
            element={<AuthGuard>
                <QuestionList />
            </AuthGuard>}
            exact={true}
        />
    </Route>
];

export default Account;