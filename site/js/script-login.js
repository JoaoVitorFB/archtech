const admin = {
    usuario: "Admin",
    senha: "archtech"
}

const usuario = {
    usuario: "Brandao",
    senha: "sptech"
}

function verificar() {
    var axUsuario = iptUsuario.value;
    var axSenhaUsuario = iptSenha.value;

    if (axUsuario == admin.usuario && axSenhaUsuario == admin.senha) {
        window.open("../html/dashboardAdmin.html", "_self");
    } else if (axUsuario == usuario.usuario && axSenhaUsuario == usuario.senha) {
        window.open("../html/dashboardEmpresa.html", "_self");
    } else {
        alert("Credenciais incorretas");
    }
}