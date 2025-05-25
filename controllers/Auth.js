import db from "../config/Database.js";
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';

const salt = 10;

export const Login = async (req, res) => {
    const { username, password } = req.body;

    const sql = "SELECT * FROM tbl_user WHERE username = ?";
    db.query(sql, [username], async (err, data) => {
        if (err) {
            console.error("Login error pada server:", err);
            return res.status(500).json({ Error: "Login error pada server" });
        }

        if (data.length === 0) {
            return res.status(404).json({ Error: "Username yang Anda masukkan tidak ada" });
        }

        try {
            const match = await bcrypt.compare(password.toString(), data[0].password);
            if (!match) {
                return res.status(401).json({ Error: "Password tidak sesuai" });
            }

            const { id, nama_user, role } = data[0];
            const token = jwt.sign({ id, nama_user, role }, "jwt-secret-key", { expiresIn: '1d' });
            res.cookie('token', token, { httpOnly: true });
            return res.json({ Status: "Success" });

        } catch (error) {
            console.error("Password compare error:", error);
            return res.status(500).json({ Error: "Password compare error" });
        }
    });
}

export const Logout = async (req, res) => {
    const token = req.cookies.token;
    if (!token) {
        return res.status(401).json({ Error: "No token provided" });
    }

    try {
        jwt.verify(token, "jwt-secret-key");
        res.clearCookie('token');
        return res.json({ Status: "Success" });
    } catch (err) {
        return res.status(401).json({ Error: "Invalid token" });
    }
}
