export default async function validateToken(req, res, next) {
  const token = req.headers["authorization"]?.replace("Bearer ", "");

  if (!token) return res.sendStatus(401);

  try {
    const user = await connection.query(
      `
        SELECT * FROM sessions WHERE token = $1
    `,
      [token]
    );
    if (user.rowCount === 0) return res.sendStatus(401);

    res.locals.user = user;
  } catch (error) {
    res.sendStatus(500);
  }
}
