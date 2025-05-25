import express from "express";
import {
    Me,
    Tampil,
    TampilObat,
    TampilSupplier,
    Tambah,
    Detail,
    Cetak,
} from "../controllers/ObatMasuk.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/', verifyUser, Me);

router.get('/obatmasuk', verifyUser, Tampil);
router.get('/getobat', verifyUser, TampilObat);
router.get('/getsupplier', verifyUser, TampilSupplier);
router.get('/detailobatmasuk/:id', verifyUser, Detail);
router.get('/cetakobatmasuk/:id', Cetak);
router.post('/tambahobatmasuk', verifyUser, Tambah);

export default router;