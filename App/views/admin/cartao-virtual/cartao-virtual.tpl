<!-- Interface do Cartão Virtual -->
<section class="container card-section">
    <h2 class="card-title">{{ $titulo }}</h2>
    <p class="card-text">{{ $subtitulo }}</p>

    <div class="virtual-card">
        <div class="card-front">
            <div class="card-header">
                <img src="/assets/imgs/bibliogo.png" alt="Bibliogo Logo" class="card-logo">
                <span class="card-type">Cartão Virtual</span>
            </div>
            <div class="card-code">
                <span id="virtual-card-code">550e8400-e29b-41d4-a716-446655440000</span>
            </div>
            <div class="card-footer">
                <div class="card-info">
                    <span class="label">Nome do Leitor</span>
                    <span id="reader-name">{{ $usuario['nome'] }}</span>
                </div>
                <div class="card-info">
                    <span class="label">Data de Emissão</span>
                    <span id="issue-date">{{ $usuario['data_cadastro'] }}</span>
                </div>
            </div>
        </div>
    </div>

    <div class="card-actions">
        <button class="btn btn-bibliogo" onclick="copyCardCode()">Copiar Código</button>
        <button class="btn btn-secondary-bibliogo" onclick="generateQRCode()">Ver QR Code</button>
    </div>

    <!-- Modal para exibir o QR Code -->
    <div class="modal fade" id="qrCodeModal" tabindex="-1" aria-labelledby="qrCodeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="qrCodeModalLabel">QR Code do Cartão Virtual</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <div id="qr-code-container"></div>
                    <p class="mt-3">Escaneie este QR Code para registrar o aluguel.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary-bibliogo" data-bs-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
</section>