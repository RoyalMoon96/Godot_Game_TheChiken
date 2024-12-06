const express = require('express');
const fs = require('fs');

const router = express.Router();
const path = require('path');

const app = express()
const port = 3000;

//app.use('/views',express.static('views'));

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Cross-Origin-Embedder-Policy", "require-corp");
  res.header("Cross-Origin-Opener-Policy", "same-origin");
  next();
});
app.use(express.static('./app/Games'));

router.get('/',(req, res) => res.sendFile(path.resolve(__dirname + "/app/index.html")));
router.get('/TheChikenIndex',(req, res) => res.sendFile(path.resolve(__dirname + "/app/Games/TheChiken/TheChikenIndex.html")));
router.get('/TheChiken',(req, res) => res.sendFile(path.resolve(__dirname + "/app/Games/TheChiken/TheChiken.html")));
router.get('/TheChiken/TheChiken.js',(req, res) => res.sendFile(path.resolve(__dirname + "/app/Games/TheChiken/TheChiken.js")));
router.get('/TheChiken/TheChiken.wasm',(req, res) => res.sendFile(path.resolve(__dirname + "/app/Games/TheChiken/TheChiken.wasm")));
router.get('/TheChiken/TheChiken.pck',(req, res) => res.sendFile(path.resolve(__dirname + "/app/Games/TheChiken/TheChiken.pck")));
router.get('/TheChiken/TheChiken.audio.worklet',(req, res) => res.sendFile(path.resolve(__dirname + "/app/Games/TheChiken/TheChiken.audio.worklet.js")));
router.get('/TheChiken/TheChiken.worker.js',(req, res) => res.sendFile(path.resolve(__dirname + "/app/Games/TheChiken/TheChiken.worker.js")));



app.use(express.json());
app.use('',router);
app.listen(port, ()=>{
    console.log("Aplicación de ejemplo corriendo en puerto ",port);
});



/* const express = require("express");

const app = express();

const server = require("http").createServer(app);
const port = process.env.PORT || 3000;

app.use(function (req, res, next) {
  res.setHeader("Cross-Origin-Opener-Policy", "same-origin");
  res.setHeader("Cross-Origin-Embedder-Policy", "require-corp");
  next();
});

app.use(express.static("./"));

server.listen(port, function () {
  console.log("Listening on port:", port);
}); */