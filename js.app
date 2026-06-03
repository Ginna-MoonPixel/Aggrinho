// js/app.js

document.addEventListener('DOMContentLoaded', () => {
    inicializarTema();
    configurarMenuMobile();
    configurarNavegacaoSPA();
});

// Controle do Modo Claro/Escuro
function inicializarTema() {
    const btnTema = document.getElementById('btn-tema');
    const temaSalvo = localStorage.getItem('tema') || 'light';
    
    document.documentElement.setAttribute('data-theme', temaSalvo);

    btnTema.addEventListener('click', () => {
        const temaAtual = document.documentElement.getAttribute('data-theme');
        const novoTema = temaAtual === 'light' ? 'dark' : 'light';
        
        document.documentElement.setAttribute('data-theme', novoTema);
        localStorage.setItem('tema', novoTema);
    });
}

// Navegação entre as seções sem recarregar a página (SPA)
function configurarNavegacaoSPA() {
    const links = document.querySelectorAll('.nav-item');
    
    links.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const alvo = link.getAttribute('data-target');
            navegarPara(alvo);
        });
    });
}

function navegarPara(idDaAba) {
    // Esconde todas as seções
    document.querySelectorAll('.aba-conteudo').forEach(aba => {
        aba.classList.remove('active');
    });
    
    // Remove classe ativa dos links
    document.querySelectorAll('.nav-item').forEach(link => {
        link.classList.remove('active');
        if(link.getAttribute('data-target') === idDaAba) {
            link.classList.add('active');
        }
    });

    // Mostra a seção desejada
    const secaoAlvo = document.getElementById(idDaAba);
    if(secaoAlvo) {
        secaoAlvo.classList.add('active');
        window.scrollTo(0, 0);
    }
}

// Menu Responsivo tipo Hambúrguer
function configurarMenuMobile() {
    const menuBtn = document.querySelector('.menu-hamburguer');
    const navLinks = document.querySelector('.nav-links');

    menuBtn.addEventListener('click', () => {
        const aberto = menuBtn.getAttribute('aria-expanded') === 'true';
        menuBtn.setAttribute('aria-expanded', !aberto);
        navLinks.classList.toggle('open');
    });
}
