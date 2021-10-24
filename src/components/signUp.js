import connection from "../database.js";
import bcrypt from 'bcrypt';

export default async function signUp(req,res){
    const {name,email,password} = req.body;
    const passwordHash = bcrypt.hashSync(password, 10);

    try{
        const validEmail = await connection.query(`SELECT * FROM users WHERE email = $1;
        `, [email]);
        
        if(validEmail.rowCount > 0) return res.status(401).send("E-mail ja cadastrado");

        await connection.query(`INSERT INTO users 
        (name, email, password) VALUES ($1, $2, $3);
        `, [name, email, passwordHash]);
        res.sendStatus(201);
    }
    catch(err){
        console.log(err);
        res.sendStatus(500);    
    }
} 