<script>
    document.addEventListener("DOMContentLoaded", function () {
        var popup = document.getElementById("popupSuperior");
        if (popup) { // Verifica se o elemento com id "popup" existe
            var popupContent = popup.querySelector(".popup-content");
            var progressBar = popup.querySelector(".progress-bar");

            var popupHidden = false; // Flag para controlar se o popup já foi ocultado

            progressBar.addEventListener("animationend", function () {
                if (!popupHidden) { // Verifica se o popup ainda não foi ocultado
                    popup.style.display = "none";
                    popupHidden = true; // Atualiza a flag para indicar que o popup foi ocultado
                }
            });

            setTimeout(function () {
                popupContent.classList.remove("shake");
            }, 5000);

            popupContent.classList.remove("d-none"); // Remover a classe "d-none" do popupContent
        } else {
            var popupErro = document.getElementById("popupSuperior");
            if (popupErro) {
                popupErro.style.display = "block";
                setTimeout(function () {
                    popupErro.style.display = "none";
                }, 5000);
            }
        }
    });
</script>
