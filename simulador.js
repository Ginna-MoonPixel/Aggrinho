// js/simulador.js

document.getElementById('btn-calcular').addEventListener('click', () => {
    const hectares = parseFloat(document.getElementById('hectares').value);
    const aguaConsumida = parseFloat(document.getElementById('agua').value);

    if (!hectares || !aguaConsumida || hectares <= 0 || aguaConsumida <= 0) {
        alert("Por favor, preencha valores válidos maiores que zero.");
        return;
    }

    // Lógica com base científica fictícia para automação e gotejamento:
    // Sensores de umidade reduzem o consumo de água em média em 35%
    const economiaAgua = aguaConsumida * 0.35;
    
    // Otimização de insumos com base no tamanho da terra
    const reducaoInsumos = hectares > 20 ? 25 : 15; 

    // Atualização dinâmica do DOM (Interface)
    document.getElementById('res-agua').textContent = economiaAgua.toFixed(1);
    document.getElementById('res-insumos').textContent = reducaoInsumos;

    // Remove a classe que esconde o resultado
    document.getElementById('resultado-simulador').classList.remove('escondido');
});
