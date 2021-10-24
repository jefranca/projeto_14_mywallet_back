import connection from "../database.js";

export default async function logout(req, res){
    const authorization = req.headers['authorization'];
    const token = authorization?.replace('Bearer ', '');

    if(!token) return res.sendStatus(401);

    try {
        const response = await connection.query(`
            SELECT * FROM sessions WHERE token = $1
        `, [token]);
        if(response.rowCount === 0) return res.sendStatus(401);

        await connection.query('DELETE FROM sessions WHERE token = $1', [token])
        res.status(200).send("session closed");
    } catch (error) {
        console.log(err);
        res.sendStatus(500);
    }
    
} 