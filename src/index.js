const express = require('express');
const app = express();
const { getSecretData } = require('./utils');

const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello, GitHub Advanced Security!');
});

app.get('/secret', (req, res) => {
  const secret = getSecretData();
  res.send(`The secret data is: ${secret}`);
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
