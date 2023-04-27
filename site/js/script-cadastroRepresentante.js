function validar() {
    var erro = false
    var nome = iptNome.value;
    var telefone = iptTelefone.value;
    var email = iptEmail.value;
   

    if (nome == "" || telefone == ""  || email == "") {
        alert("Preencha todos os campos");
    } else { 
       
        if (telefone.length < 10) {
            alert("Telefone inválido");
            erro = true
        }
       
        if (email.indexOf('@') == -1) {
            alert("E-mail inválido");
            erro = true
        }
       

    }
if (!erro) {
    alert (`Representante cadastrado com sucesso`)
iptNome.value = ``
 
 
iptTelefone.value = ``
 
 
 
iptEmail.value = ``


}
        /*Fim verificação para ver se os campos são numéricos*/
    
}
