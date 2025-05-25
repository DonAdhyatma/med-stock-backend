import express from "express";
import {
    Me,
    Tampil,
    Tambah,
    Edit,
    Update,
    Delete
} from "../controllers/Obat.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/', verifyUser, Me);

router.get('/obat', verifyUser, Tampil);
router.post('/tambahobat', verifyUser, Tambah);
router.get('/editobat/:id', verifyUser, Edit);
router.put('/updateobat/:id', verifyUser, Update);
router.delete('/deleteobat/:id', verifyUser, Delete);

export default router;