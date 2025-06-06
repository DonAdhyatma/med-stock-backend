import express from "express";
import cors from "cors";
import db from "./config/Database.js";
import cookieParser from 'cookie-parser';

import AuthRoute from "./routes/AuthRoute.js";

import UserRoute from "./routes/UserRoute.js";
import SupplierRoute from "./routes/SupplierRoute.js";
import CustomerRoute from "./routes/CustomerRoute.js";
import ObatRoute from "./routes/ObatRoute.js";
import ObatMasukRoute from "./routes/ObatMasukRoute.js";
import ObatKeluarRoute from "./routes/ObatKeluarRoute.js";
import LaporanRoute from "./routes/LaporanRoute.js";

const app = express();
app.use(express.json());
app.use(cors({
    origin: ["http://localhost:3000"],
    methods: ["POST", "GET", "DELETE", "PUT"],
    credentials: true
}));
app.use(cookieParser());

app.use(AuthRoute);
app.use(UserRoute);
app.use(SupplierRoute);
app.use(CustomerRoute);
app.use(ObatRoute);
app.use(ObatMasukRoute);
app.use(ObatKeluarRoute);
app.use(LaporanRoute);

app.listen(8081, () => {
    console.log("Server Running ...");
})