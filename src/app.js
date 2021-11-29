import express from "express";
import cors from "cors";
import signIn from "./controllers/signIn.js"
import signUp from "./controllers/signUp.js";
import postBalance from "./controllers/postBalance.js";
import getBalance from "./controllers/getBalance.js";
import logout from "./controllers/logout.js";
import validateToken from "./middlewares/validateToken.js";

const app = express();
app.use(express.json());
app.use(cors());

app.post('/', signIn);

app.post ('/signup', signUp);

app.post ('/balance',validateToken, postBalance);

app.get ('/balance',validateToken, getBalance);

app.delete ('/logout',validateToken, logout);

export default app;
