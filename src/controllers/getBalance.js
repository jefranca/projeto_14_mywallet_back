import connection from "../database/database.js";

export default async function getBalance(req, res){
    const {user} = req.locals;

    try{
        const userId = user.rows[0]?.userId;

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