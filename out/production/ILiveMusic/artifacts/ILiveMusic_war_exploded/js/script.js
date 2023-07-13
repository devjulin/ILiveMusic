/*Modo Claro & Escuro*/
function toggleModo() {
    var body = document.body;
    var btn = document.getElementById("modo-btn");
    if (body.classList.contains("modo-claro")) {
        body.classList.remove("modo-claro");
        body.classList.add("modo-escuro");
        btn.textContent = "Modo Escuro";
        btn.classList.remove("modo-claro");
        btn.classList.add("modo-escuro");
        localStorage.setItem("modo", "escuro"); // armazena a seleção do usuário como "escuro"
    } else {
        body.classList.remove("modo-escuro");
        body.classList.add("modo-claro");
        btn.textContent = "Modo Claro";
        btn.classList.remove("modo-escuro");
        btn.classList.add("modo-claro");
        localStorage.setItem("modo", "claro"); // armazena a seleção do usuário como "claro"
    }
}

window.addEventListener("load", function () {
    var modo = localStorage.getItem("modo");
    var body = document.body;
    var btn = document.getElementById("modo-btn");
    if (modo === "escuro") {
        body.classList.add("modo-escuro");
        btn.textContent = "Modo Claro/Escuro";
        btn.classList.remove("modo-claro");
        btn.classList.add("modo-escuro");
    } else {
        body.classList.add("modo-claro");
        btn.textContent = "Modo Escuro";
        btn.classList.remove("modo-escuro");
        btn.classList.add("modo-claro");
    }
});
 