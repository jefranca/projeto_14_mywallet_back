import connection from "../database/database.js";

export default async function logout(req, res){
    const token = req.headers["authorization"]?.replace("Bearer ", "");

    try {   
        await connection.query('DELETE FROM sessions WHERE token = $1', [token])
        res.status(200).send("session closed");
    } catch (error) {
        console.log(err);
        res.sendStatus(500);
    }
    
} 