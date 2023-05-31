var alertas = [];

function obterdados(idCorredor, diaSelecionado, mesSelecionado, medirmes) {
    fetch(`/medidas/tempo-real/${idCorredor}/${diaSelecionado}/${mesSelecionado}/${medirmes}`)
        .then(resposta => {

            if (resposta.ok) {
                resposta.json().then(resposta => {

                    console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);

                    alertar(resposta, idCorredor);
                });
            } else {

                console.error('Nenhum dado encontrado ou erro na API');
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados do aquario p/ gráfico: ${error.message}`);
        });

}

function alertar(resposta, idCorredor) {
    
    var fluxo = resposta[0].fluxo;

    console.log(idCorredor === resposta[0].idCorredor)
    
    var grauDeAviso ='';


    var limites = {
        muito_quente: 40,
        quente: 48,
       
    };

    var classe_temperatura = 'cor-alerta';

    if (fluxo <= limites.muito_quente) {
        classe_temperatura = 'cor-alerta perigo-quente';
        grauDeAviso = 'muito baixo'   
        grauDeAvisoCor = 'cor-alerta perigo-quente'
        // alerta.style.display = 'block'
        exibirAlerta(fluxo, idCorredor, grauDeAviso, grauDeAvisoCor)
    }
    else if (fluxo > limites.muito_quente && fluxo <= limites.quente) {
        classe_temperatura = 'cor-alerta alerta-quente';
        grauDeAviso = 'baixo'
        grauDeAvisoCor = 'cor-alerta alerta-quente'
        // alerta.style.display = 'block'
        exibirAlerta(fluxo, idCorredor, grauDeAviso, grauDeAvisoCor)
    } else {
        removerAlerta(idCorredor);
    }
    // else if (fluxo <= limites.frio && fluxo > limites.muito_frio) {
    //     classe_temperatura = 'cor-alerta alerta-frio';
    //     grauDeAviso = 'alerta frio'
    //     grauDeAvisoCor = 'cor-alerta alerta-frio'
    //     exibirAlerta(fluxo, idCorredor, grauDeAviso, grauDeAvisoCor)
    // }
    // else if (fluxo <= limites.muito_frio) {
    //     classe_temperatura = 'cor-alerta perigo-frio';
    //     grauDeAviso = 'perigo frio'
    //     grauDeAvisoCor = 'cor-alerta perigo-frio'
    //     exibirAlerta(fluxo, idCorredor, grauDeAviso, grauDeAvisoCor)
    // }

    // var card;

    // if (idCorredor == 1) {
    //     temp_aquario_1.innerHTML = temp + "°C";
    //     card = card_1
    // } else if (idCorredor == 2) {
    //     temp_aquario_2.innerHTML = temp + "°C";
    //     card = card_2
    // } else if (idCorredor == 3) {
    //     temp_aquario_3.innerHTML = temp + "°C";
    //     card = card_3
    // } else if (idCorredor == 4) {
    //     temp_aquario_4.innerHTML = temp + "°C";
    //     card = card_4
    // }

  
}

function exibirAlerta(fluxo, idCorredor, grauDeAviso, grauDeAvisoCor) {

    var indice = alertas.findIndex(item => item.idCorredor == idCorredor);

    if (indice >= 0) {
        alertas[indice] = { idCorredor, fluxo, grauDeAviso, grauDeAvisoCor }
    } else {
        alertas.push({ idCorredor, fluxo, grauDeAviso, grauDeAvisoCor });
    }

    exibirCards();
    
// Dentro da div com classe grauDeAvisoCor há um caractere "invisível", 
// que pode ser inserido clicando com o seu teclado em alt+255 ou pelo código adicionado acima.
}

function removerAlerta(idCorredor) {
    console.log(`to aqsa`)
    alertas = alertas.filter(item => item.idCorredor != idCorredor);
   
    exibirCards();
}
 
function exibirCards() {
    alerta.innerHTML = '';

    for (var i = 0; i < alertas.length; i++) {
        var mensagem = alertas[i];
        alerta.innerHTML += transformarEmDiv(mensagem);
    }
}

function transformarEmDiv({ idCorredor, fluxo, grauDeAviso, grauDeAvisoCor }) {
    return `<div id="alertaCorredor${idCorredor}" style="margin-bottom:10px; background-color: #f2f3f4;" class="mensagem-alarme">
    <div style="background-color: #f4f2f3;" class="informacao">
    <div class="${grauDeAvisoCor}">&#12644;</div> 
     <h3>O corredor ${idCorredor} está com o fluxo ${grauDeAviso}!</h3>
    <span>Fluxo: ${fluxo}</span> 
    </div>
    <div class="alarme-sino"></div>
    </div>`;
}
