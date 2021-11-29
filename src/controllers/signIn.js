import connection from "../database.js";
import bcrypt from 'bcrypt';
import {v4 as uuid} from 'uuid';

export default async function signIn(req,res){
    const {email,password} = req.body;
    try{
        const result = await connection.query(`SELECT * FROM users WHERE email = $1;
        `, [email]);

        const user = result.rows[0];

        if(user && bcrypt.compareSync(password, user.password)){
            const token = uuid();

            await connection.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2)
            `, [user.id, token]);

            delete user.password;
            const userData = {
                token,
                user
            } ;

            res.status(200).send(userData);
        }
        else{
            res.status(401).send("E-mail ou Senha incorreto")
        }
    }
    catch(err){
        console.log(err);
        res.sendStatus(500);
    }
} 