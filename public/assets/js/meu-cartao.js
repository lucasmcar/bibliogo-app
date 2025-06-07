function copyCardCode() {
    const code = document.getElementById('virtual-card-code').textContent;
    navigator.clipboard.writeText(code).then(() => {
        alert('Código copiado com sucesso!');
    }).catch(err => {
        console.error('Erro ao copiar o código:', err);
    });
}

function generateQRCode() {
    if (typeof QRCode === 'undefined') {
        console.error('Biblioteca QRCode.js não foi carregada corretamente.');
        alert('Erro ao gerar o QR Code. Por favor, recarregue a página ou entre em contato com o suporte.');
        return;
    }

    const code = document.getElementById('virtual-card-code').textContent;
    const qrCodeContainer = document.getElementById('qr-code-container');
    qrCodeContainer.innerHTML = '';

    new QRCode(qrCodeContainer, {
        text: code,
        width: 200,
        height: 200,
        colorDark: '#2c2c2c',
        colorLight: '#FFFFFF',
        correctLevel: QRCode.CorrectLevel.H
    });

    const qrModal = new bootstrap.Modal(document.getElementById('qrCodeModal'));
    qrModal.show();
}

// Toggle para mostrar/esconder o código
const codeElement = document.getElementById('virtual-card-code');
const toggleButton = document.getElementById('toggle-code-btn');
let isCodeVisible = true;

if (toggleButton && codeElement) {

    codeElement.classList.add('blurred');
    codeElement.classList.remove('visible');
    toggleButton.querySelector('i').className = 'fas fa-eye';
    
    toggleButton.addEventListener('click', function () {
        isCodeVisible = !isCodeVisible;
        codeElement.classList.toggle('blurred', !isCodeVisible);
        codeElement.classList.toggle('visible', isCodeVisible);
        toggleButton.querySelector('i').className = isCodeVisible ? 'fas fa-eye-slash' : 'fas fa-eye';

    });
}