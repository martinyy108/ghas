const fs = require('fs');

const getSecretData = () => {
  const data = fs.readFileSync('config/default.json');
  const config = JSON.parse(data);
  return config.apiKey;
};

module.exports = {
  getSecretData
};
