var database = require("../database/config");

function buscarUltimasMedidas(idCorredor, diaSelecionado, limite_linhas, mesSelecionado, medirmes) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas}
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        momento,
                        FORMAT(momento, 'HH:mm:ss') as momento_grafico
                    from medida
                    where fk_aquario = ${idCorredor}
                    order by id desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        if (medirmes == 1) {
            // QUERY DO MES
            instrucaoSql = 
            `SELECT DATE_FORMAT(dds_data, '%d') AS momento_grafico, SUM(dds_fluxo) AS fluxo
            FROM dados
            WHERE dds_data LIKE '${mesSelecionado}-%' and crd_idCorredor= ${idCorredor}
            GROUP BY dds_data ORDER BY dds_data DESC`
     
        }else if (medirmes == 0) {
            // QUERY DO DIARIO
            instrucaoSql = `select 
            dds_fluxo as fluxo, 
            dds_horaFinal as momento_grafico
                        from dados
                        where crd_idCorredor = ${idCorredor} and dds_data = '${diaSelecionado}'
                        order by dds_idDados desc limit ${limite_linhas};`
        }
       
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idCorredor, diaSelecionado,  mesSelecionado, medirmes) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        CONVERT(varchar, momento, 108) as momento_grafico, 
                        fk_aquario 
                        from medida where fk_aquario = ${idCorredor} 
                    order by id desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {

        // query do mes
        if (medirmes == 1) {
            instrucaoSql = `SELECT DATE_FORMAT(dds_data, '%d') AS momento_grafico, SUM(dds_fluxo) AS fluxo
            FROM dados
            WHERE dds_data LIKE '${mesSelecionado}-%' and crd_idCorredor= ${idCorredor}
            GROUP BY dds_data ORDER BY dds_data DESC`;
      // query do mes
        }else if(medirmes == 0){
            instrucaoSql = `select 
            dds_fluxo as fluxo, 
            dds_horaFinal as momento_grafico
                        from dados
                        where crd_idCorredor = ${idCorredor} and dds_data = '${diaSelecionado}-%'
                        order by dds_idDados desc limit 1;`;
        }
        
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
