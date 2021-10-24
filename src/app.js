import express from "express";
import cors from "cors";
import signIn from "./components/signIn.js"
import signUp from "./components/signUp.js";
import postBalance from "./components/postBalance.js";
import getBalance from "./components/getBalance.js";
import logout from "./components/logout.js";

const app = express();
app.use(express.json());
app.use(cors());

app.post('/', signIn);

app.post ('/signup', signUp);

app.post ('/balance', postBalance);

app.get ('/balance', getBalance);

app.delete ('/logout', logout);

export default app;
