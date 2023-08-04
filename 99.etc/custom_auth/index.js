const express = require("express");
const app = express();
const port = 3000;

app.get("/apikey/verify", (req, res) => {
  console.log(req.headers.authorization);
  console.log("zzzzzzzzzzzzz");
  console.log(req);
  if (req.headers.authorization === "true") {
    return res.status(200).send("holy! Success! HTTP 200 OK");
  } else {
    return res.status(401).send("moly! Unauthorized! HTTP 401 Unauthorized");
  }
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
