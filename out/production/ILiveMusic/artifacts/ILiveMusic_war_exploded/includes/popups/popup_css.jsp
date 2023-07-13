<style>
    .popup-superior {
        display: block;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 50%;
        pointer-events: none;
        height: 100%;
        /*background-color: rgba(0, 0, 0, 0.5);*/
    }

    .popup-content {
        background-color: rgba(82, 0, 92, 0.94);
        color: white;
        margin: 5% 75%;
        z-index: 9999;
        padding: 20px;
        border: none;
        width: 50%;
        border-radius: 10px;
        position: relative;
        animation: popup-appear 0.5s ease-out;
        overflow: hidden; /* Adicionado para conter o progress bar */
    }

    @keyframes popup-appear {
        from {
            opacity: 0;
            transform: translateY(-50px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .progress-container {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 10px;
        background-color: rgba(0, 0, 0, 0.3);
        border-radius: 10px;
        overflow: hidden;
    }

    .progress-bar {
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.6);
        animation: progress-bar 5s linear;
        transform-origin: left;
    }

    @keyframes progress-bar {
        0% {
            width: 100%;
        }
        100% {
            width: 0%;
        }
    }

    .shake {
        animation: shake 0.5s ease-in-out;
    }

    @keyframes shake {
        0% {
            transform: rotate(0deg);
        }
        10% {
            transform: rotate(4deg);
        }
        20% {
            transform: rotate(-4deg);
        }
        30% {
            transform: rotate(2deg);
        }
        40% {
            transform: rotate(-3deg);
        }
        50% {
            transform: rotate(5deg);
        }
        60% {
            transform: rotate(-2deg);
        }
        70% {
            transform: rotate(4deg);
        }
        80% {
            transform: rotate(-4deg);
        }
        90% {
            transform: rotate(2deg);
        }
        100% {
            transform: rotate(0deg);
        }
    }

    .impacto {
        animation-name: impacto;
        animation-duration: 1.2s;
        animation-iteration-count: 1;
        animation-timing-function: ease-in-out;
    }

    @keyframes impacto {
        0% {
            box-shadow: 0 0 0 0 rgba(255, 255, 255, 0.8);
            transform: scale(0);
        }
        50% {
            box-shadow: 0 0 0 1000px rgba(255, 255, 255, 0);
            transform: scale(1.2);
        }
        100% {
            box-shadow: 0 0 0 0 rgba(255, 255, 255, 0);
            transform: scale(1);
        }
    }
</style>