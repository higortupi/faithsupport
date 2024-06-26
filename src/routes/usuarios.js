var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.post("/mensagem", function (req, res) {
    usuarioController.mensagem(req, res);
})

router.post("/conexao", function (req, res) {
    usuarioController.conexao(req, res);
})

router.post("/feedback", function (req, res) {
    usuarioController.feedback(req, res);
});

module.exports = router;