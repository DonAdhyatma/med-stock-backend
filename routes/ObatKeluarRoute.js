import express from "express";
import {
    Me,
    Tampil,
    TampilObat,
    TampilCustomer,
    Tambah,
    Detail,
    Cetak
} from "../controllers/ObatKeluar.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/', verifyUser, Me);

router.get('/obatkeluar', verifyUser, Tampil);
router.get('/getobat', verifyUser, TampilObat);
router.get('/getcustomer', verifyUser, TampilCustomer);
router.get('/detailobatkeluar/:id', verifyUser, Detail);
router.get('/cetakobatkeluar/:id', Cetak);
router.post('/tambahobatkeluar', verifyUser, Tambah);

export default router;