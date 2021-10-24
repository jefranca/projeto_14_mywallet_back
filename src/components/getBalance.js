import connection from "../database.js";

export default async function getBalance(req, res){
    const authorization = req.headers['authorization'];
    const token = authorization?.replace('Bearer ', '');

    if(!token) return res.sendStatus(401);

    try{
        const response = await connection.query(`
            SELECT "userId" FROM sessions WHERE token = $1
        `, [token]);
        const userId = response.rows[0]?.userId;

        if(userId) {
            const result = await connection.query(`SELECT * FROM balance WHERE "userId"=$1;`, [userId])
            return res.status(200).send(result.rows);
          } else {
            res.sendStatus(401);
          }


    }
    catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}