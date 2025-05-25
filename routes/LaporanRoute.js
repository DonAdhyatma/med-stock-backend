import express from "express";
import {
    Me,
    TampilObatMasuk,
    TampilObatKeluar,
    CetakObatMasuk,
    CetakObatKeluar
} from "../controllers/Laporan.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/', verifyUser, Me);

router.get('/laporanobatmasuk', verifyUser, TampilObatMasuk);
router.get('/laporanobatkeluar', verifyUser, TampilObatKeluar);
router.get('/cetakallobatmasuk', CetakObatMasuk);
router.get('/cetakallobatkeluar', CetakObatKeluar);

export default router;