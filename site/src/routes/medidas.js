var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idCorredor/:diaSelecionado/:mesSelecionado/:medirmes", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idCorredor/:diaSelecionado/:mesSelecionado/:medirmes", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/tempo-real-geral/:dataAtual", function (req, res) {
    medidaController.buscarMedidasGeral(req, res);
})

module.exports = router;