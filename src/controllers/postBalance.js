import connection from "../database/database.js";

export default async function postBalance(req, res){
    const {amount, description, type}=req.body;
    const {user} = req.locals;
    const userId = user.rows[0]?.userId;

    try{
        if(user) {
            const date = new Date().toISOString().split('T')[0];
            await connection.query(`INSERT INTO balance
            ("userId",amount,description,type,date) VALUES ($1,$2,$3,$4,$5)
            `, [userId,amount,description,type,date])
            return res.sendStatus(201);
            
          } else {
            res.sendStatus(401);
          }


    }
    catch(err){
        res.sendStatus(500);
    }
}