var medidaModel = require("../models/medidaModel");

function buscarUltimasMedidas(req, res) {

    const limite_linhas = 13;
    var mesSelecionado = req.params.mesSelecionado
    var idCorredor = req.params.idCorredor;
    var diaSelecionado = req.params.diaSelecionado;
    var medirmes = req.params.medirmes;

    console.log(`${medirmes} Recuperando as ultimas ${limite_linhas} medidas de ${diaSelecionado}`);

    medidaModel.buscarUltimasMedidas(idCorredor, diaSelecionado, limite_linhas,mesSelecionado,medirmes).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarMedidasEmTempoReal(req, res) {

    var mesSelecionado = req.params.mesSelecionado
    var idCorredor = req.params.idCorredor;
    var diaSelecionado = req.params.diaSelecionado;
    var medirmes = req.params.medirmes;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(idCorredor,diaSelecionado,mesSelecionado,medirmes).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal

}