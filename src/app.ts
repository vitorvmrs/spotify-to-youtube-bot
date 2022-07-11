import express from 'express';

const app = express();
const PORT = 3000;

app.get('/', (_: any, res: any) => {
  res.send("Arraza's Server is running =]");
})

app.listen(PORT, () => {
  console.log(`Listening your musics on PORT ${PORT}`)
})
