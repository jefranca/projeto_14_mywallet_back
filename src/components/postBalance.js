import connection from "../database.js";

export default async function postBalance(req, res){
    const authorization = req.headers['authorization'];
    const token = authorization?.replace('Bearer ', '');

    const {amount, description, type}=req.body;

    if(!token) return res.sendStatus(401);

    try{
        const result = await connection.query(`
            SELECT * FROM sessions
            JOIN users
            ON sessions."userId" = users.id
            WHERE sessions.token = $1
        `, [token]);
        const user = result.rows[0];

        if(user) {
            const date = new Date().toISOString().split('T')[0];
            await connection.query(`INSERT INTO balance
            ("userId",amount,description,type,date) VALUES ($1,$2,$3,$4,$5)
            `, [user.id,amount,description,type,date])
            return res.sendStatus(201);
            
          } else {
            res.sendStatus(401);
          }


    }
    catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}