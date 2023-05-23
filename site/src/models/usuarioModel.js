var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT * FROM usuario JOIN representante ON representante.rpt_idRepresentante = usuario.rpt_idRepresentante JOIN empresa ON representante.emp_idEmpresa = empresa.emp_idEmpresa WHERE usr_login = '${email}' AND usr_senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nomeEmpresa, nomeFantasiaEmpresa, cnpj, logradouro, numLogradouro, cep, email, telefone, telefoneCelular) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nomeEmpresa, nomeFantasiaEmpresa, cnpj, logradouro, numLogradouro, cep, email, telefone, telefoneCelular);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO empresa (emp_nome, emp_nomeFantasia, emp_cnpj, emp_logradouro, emp_numLogradouro, emp_CEP, emp_email, emp_telefone, emp_telefoneCelular) VALUES ('${nomeEmpresa}', '${nomeFantasiaEmpresa}', '${cnpj}', '${logradouro}', '${numLogradouro}', '${cep}', '${email}', '${telefone}', '${telefoneCelular}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    entrar,
    cadastrar,
    listar,
};