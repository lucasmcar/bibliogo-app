-- Banco de dados
CREATE DATABASE bibliogo_db;
USE bibliogo_db;

-- ====================================
-- TABELAS PRINCIPAIS
-- ====================================

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    tipo ENUM('leitor', 'dono') DEFAULT 'leitor',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE enderecos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    cidade VARCHAR(100),
    bairro VARCHAR(100),
    estado VARCHAR(2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE bibliotecas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);
CREATE INDEX idx_nome_biblioteca ON bibliotecas(nome);

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    biblioteca_id INT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100),
    genero VARCHAR(50),
    paginas INT,
    estado_fisico ENUM('novo', 'bom', 'usado', 'ruim') DEFAULT 'bom',
    preco DECIMAL(6,2),
    imagem_url VARCHAR(255),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(id) ON DELETE SET NULL
);
CREATE INDEX idx_livros_titulo_autor ON livros(titulo, autor);

-- ====================================
-- ALUGUEIS, AVALIAÇÕES, MENSAGENS
-- ====================================

CREATE TABLE alugueis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT NOT NULL,
    locador_id INT NOT NULL,
    leitor_id INT NOT NULL,
    status ENUM('pendente', 'em_andamento', 'finalizado', 'cancelado') DEFAULT 'pendente',
    data_inicio DATETIME,
    data_fim DATETIME,
    tempo_leitura_min INT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (livro_id) REFERENCES livros(id),
    FOREIGN KEY (locador_id) REFERENCES usuarios(id),
    FOREIGN KEY (leitor_id) REFERENCES usuarios(id)
);
CREATE INDEX idx_status_aluguel ON alugueis(status);

CREATE TABLE avaliacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluguel_id INT NOT NULL,
    avaliador_id INT NOT NULL,
    avaliado_id INT NOT NULL,
    nota TINYINT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (aluguel_id) REFERENCES alugueis(id),
    FOREIGN KEY (avaliador_id) REFERENCES usuarios(id),
    FOREIGN KEY (avaliado_id) REFERENCES usuarios(id)
);
CREATE INDEX idx_avaliacoes_nota ON avaliacoes(nota);

CREATE TABLE mensagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluguel_id INT NOT NULL,
    remetente_id INT NOT NULL,
    mensagem TEXT NOT NULL,
    enviado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (aluguel_id) REFERENCES alugueis(id),
    FOREIGN KEY (remetente_id) REFERENCES usuarios(id)
);
CREATE INDEX idx_mensagens_aluguel ON mensagens(aluguel_id);

-- ====================================
-- TRIGGERS OPCIONAIS PARA PERFORMANCE E INTEGRIDADE
-- ====================================

-- Atualiza o tempo de leitura ao finalizar um aluguel
DELIMITER $$
CREATE TRIGGER atualizar_tempo_leitura
BEFORE UPDATE ON alugueis
FOR EACH ROW
BEGIN
    IF NEW.status = 'finalizado' AND OLD.status != 'finalizado' THEN
        SET NEW.tempo_leitura_min = TIMESTAMPDIFF(MINUTE, NEW.data_inicio, NOW());
        SET NEW.data_fim = NOW();
    END IF;
END$$
DELIMITER ;

-- Garante que preço mínimo e máximo dos livros estejam dentro da faixa
DELIMITER $$
CREATE TRIGGER validar_preco_livro
BEFORE INSERT ON livros
FOR EACH ROW
BEGIN
    IF NEW.preco < 5.00 THEN
        SET NEW.preco = 5.00;
    ELSEIF NEW.preco > 20.00 THEN
        SET NEW.preco = 20.00;
    END IF;
END$$
DELIMITER ;