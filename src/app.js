import express from "express";
import pg from "pg";
import cors from "cors";

const app = express;
app.use(express.json());
app.use(cors());
const {Pool} = pg;