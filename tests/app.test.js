import app from '../src/app.js';
import supertest from "supertest";
import connection from "../src/database/database.js";
import bcrypt from "bcrypt";

describe('POST / -  SignIn', () => {
    beforeEach(async () => {
        const user = {
            name: "Teste",
            email: "teste@teste.com",
            password: bcrypt.hashSync("teste", 10)
        };
            await connection.query("INSERT INTO users (name, email, password) VALUES ($1, $2, $3);", 
            [user.name, user.email, user.password]
        );
    });

    afterEach(async () => {
        await connection.query("DELETE FROM users WHERE name = $1;", ["Teste"]);
    });

    it('Caso e-mail ou senha esteja errado, retorna 401', async () => {
        const user = {
                email: "teste@teste.com",
                password: "1234"
            };
        const result = await supertest(app)
            .post("/")
            .send(user);

        expect(result.status).toEqual(401);
        expect(result.body).toEqual({message: "E-mail ou Senha incorreto"});
    });

    it('Caso usuario digite e-mail e senha corretos, retorna 200', async () => {
        const user = {
            email: "teste@teste.com",
            password: "teste"
        };
        const result = await supertest(app)
            .post("/")
            .send(user);

        expect(result.status).toEqual(200);
        expect(result.body).toEqual(
            {
                user: expect.any(String),
                token: expect.any(Object)
            }
        )
    });
});

describe('POST / -  SignUp', () => {
    beforeEach(async () => {
        const user = {
            name: "Teste",
            email: "teste@teste.com",
            password: bcrypt.hashSync("teste", 10)
        };
            await connection.query("INSERT INTO users (name, email, password) VALUES ($1, $2, $3);", 
            [user.name, user.email, user.password]
        );
    });

    afterEach(async () => {
        await connection.query("DELETE FROM users WHERE name = $1;", ["Teste"]);
    });

    it('Caso e-mail já esteja cadastrado, retorna 401', async () => {
        const user = {
                name: "Teste",
                email: "teste@teste.com",
                password: "1234"
            };
        const result = await supertest(app)
            .post("/")
            .send(user);

        expect(result.status).toEqual(401);
        expect(result.body).toEqual({message: "E-mail ja cadastrado"});
    });

    it('Caso usuario digite e-mail não cadastrado, pode repetir o nome ou senha, retorna 201', async () => {
        const user = {
            name: "Teste",
            email: "segundoteste@teste.com",
            password: "teste"
        };
        const result = await supertest(app)
            .post("/")
            .send(user);

        expect(result.status).toEqual(201);
    });
});