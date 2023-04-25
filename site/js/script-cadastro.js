function validar() {
    var nome = iptNome.value;
    var nomeFantasia = iptNomeFantasia.value;
    var cnpj = iptCNPJ.value;
    var telefone = iptTelefone.value;
    var cep = iptCEP.value;
    var numero = iptNumero.value;
    var endereco = iptEndereco.value;
    var email = iptEmail.value;
    var senha = iptSenha.value;
    var confirmarSenha = iptConfirmarSenha.value;

    if (nome == "" || nomeFantasia == "" || cnpj == "" || telefone == "" || cep == "" || numero == "" || endereco == "" || email == "" || senha == "" || confirmarSenha == "") {
        alert("Preencha todos os campos");
    } else {
        if (cnpj.length < 14) {
            alert("CNPJ inválido");
        }
        if (telefone.length < 10) {
            alert("Telefone inválido");
        }
        if (cep.length < 8) {
            alert("CEP inválido");
        }
        if (email.indexOf('@') == -1) {
            alert("E-mail inválido");
        }
        if (senha != confirmarSenha) {
            alert("Senhas não idênticas");
        }

        /*Início verificação para ver se os campos são numéricos*/
        cnpj = Number(iptCNPJ.value);
        telefone = Number(iptTelefone.value);
        cep = Number(iptCEP.value);
        numero = Number(iptNumero.value);
        if (isNaN(cnpj) == true) {
            alert("CNPJ inválido");
        }
        if (isNaN(telefone) == true) {
            alert("Telefone inválido");
        }
        if (isNaN(cep) == true) {
            alert("CEP inválido");
        }
        if (isNaN(numero) == true) {
            alert("Número inválido");
        }
        /*Fim verificação para ver se os campos são numéricos*/
    }
}
