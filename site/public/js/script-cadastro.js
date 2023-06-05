function validar() {
    var erro = false
    var nome = iptNome.value;
    var nomeFantasia = iptNomeFantasia.value;
    var cnpj = iptCNPJ.value;
    var telefone = iptTelefone.value;
    var cep = iptCEP.value;
    var numero = iptNumLogradouro.value;
    var endereco = iptLogradouro.value;
    var email = iptEmail.value;
   

    if (nome == "" || nomeFantasia == "" || cnpj == "" || telefone == "" || cep == "" || numero == "" || endereco == "" || email == "") {
        alert("Preencha todos os campos");
    } else {
        if (cnpj.length < 14) {
            alert("CNPJ inválido");
            erro = true
        }
        if (telefone.length < 10) {
            alert("Telefone inválido");
            erro = true
        }
        if (cep.length < 8) {
            alert("CEP inválido");
            erro = true
        }
        if (email.indexOf('@') == -1) {
            alert("E-mail inválido");
            erro = true
        }
       

        /*Início verificação para ver se os campos são numéricos*/
        cnpj = Number(iptCNPJ.value);
        telefone = Number(iptTelefone.value);
        cep = Number(iptCEP.value);
        numero = Number(iptNumero.value);
        if (isNaN(cnpj) == true) {
            alert("CNPJ inválido");
            erro = true
        }
        if (isNaN(telefone) == true) {
            alert("Telefone inválido");
            erro = true
        }
        if (isNaN(cep) == true) {
            alert("CEP inválido");
            erro = true
        }
        if (isNaN(numero) == true) {
            alert("Número inválido");
            erro = true
        }
if (!erro) {
    cadastrarEmpresa();
    alert (`Usuário cadastrado com sucesso`)
iptNome.value = ``
iptNomeFantasia.value = ``
iptCNPJ.value = ``
iptTelefone.value = ``
iptCEP.value = ``
iptNumero.value = ``
iptEndereco.value = ``
iptEmail.value = ``


}
        /*Fim verificação para ver se os campos são numéricos*/
    }
}
