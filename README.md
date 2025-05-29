# 📂 MCP File Reader

Servidor MCP para leitura e extração de conteúdo de arquivos, com suporte a múltiplos formatos e URLs.

## ✨ Visão Geral

Este projeto implementa um servidor baseado no `FastMCP` que permite:

- Leitura de arquivos locais e remotos (via URL)
- Extração de conteúdo textual estruturado
- Suporte a múltiplos formatos: `.pdf`, `.docx`, `.txt`, `.csv`, `.json`, `.xml`, `.html`, `.xlsx`, entre outros
- Download com verificação de tamanho e tratamento de SSL
- Integração direta com o ecossistema **MCP** (Model Context Protocol)

---

## 🚀 Funcionalidades

- 📄 Leitura automática por extensão de arquivo
- 🌐 Download de arquivos via HTTP/HTTPS/FTP
- ⚙️ Extração de conteúdo otimizada
- 🔒 Suporte opcional a `.env` com `python-dotenv`
- 📦 Modularidade para adicionar novos tipos de arquivo

---

## 📁 Formatos Suportados

| Tipo        | Extensões                     | Requisitos de Biblioteca         |
|-------------|-------------------------------|----------------------------------|
| Texto       | `.txt`, `.md`, `.py`, `.js`   | Nenhum                           |
| HTML        | `.html`, `.htm`               | `beautifulsoup4` (opcional)      |
| XML         | `.xml`                        | `xml.etree.ElementTree` (nativo) |
| JSON        | `.json`                       | Nenhum                           |
| CSV/Excel   | `.csv`, `.xlsx`, `.xls`       | `pandas`, `openpyxl`             |
| PDF         | `.pdf`                        | `PyPDF2` ou `pdfplumber`         |
| Word        | `.docx`, `.doc`               | `python-docx`                    |

> ⚠️ Formatos que exigem bibliotecas externas são desativados caso as dependências não estejam presentes.

---

## 📦 Instalação

1. Clone este repositório:

```bash
git clone https://github.com/seu-usuario/mcp-file-reader.git
cd mcp-file-reader
```

2. Instale as dependências necessárias:

```bash
pip install -r requirements.txt
```

Caso deseje suporte completo, certifique-se de incluir:

- PyPDF2
- pdfplumber
- python-docx
- pandas
- openpyxl
- beautifulsoup4
- requests
- python-dotenv

3. (Opcional) Configure um arquivo .env:

```bash
MCP_HOST=0.0.0.0
PORT=8050
```

---

## ▶️ Execução

Execute o servidor:

```bash
python3 mcp_file_reader.py
```

O servidor MCP será iniciado e escutará na porta configurada.

---

## 🛠️ Uso com MCP

Este servidor registra uma ferramenta file-reader no protocolo MCP, podendo ser chamado diretamente por outros agentes para:

- Processar arquivos enviados
- Buscar conteúdos em URLs remotas
- Obter o texto completo ou sumarizado

---

## 📌 Estrutura Interna

- `FileReader`: Classe principal com métodos para identificar tipo, baixar e processar arquivos
- `FastMCP`: Integração com o protocolo MCP para servir a ferramenta
- `dotenv`: (Opcional) Configuração via variáveis de ambiente
- `logger`: Logging robusto para facilitar depuração

---

## 📚 Exemplos de Uso

Via outro agente MCP:

```json
{
  "tool": "file-reader",
  "input": {
    "file_path": "https://exemplo.com/arquivo.pdf"
  }
}
```

---

## ⚠️ Avisos de Segurança

- O SSL está desabilitado por padrão para URLs com certificados inválidos (verify=False). Não use isso em produção sem cuidado.
- O limite de tamanho de arquivos é 50MB por padrão.

---

## ✅ Roadmap Futuro

- Adicionar suporte a arquivos .doc com conversão via soffice ou mammoth
- Processamento assíncrono com fila
- Integração com OCR para imagens/PDFs escaneados
- Versão Dockerizada

---

## 👥 Contribuição

Pull requests são bem-vindos! Para mudanças maiores, por favor abra uma issue primeiro para discutir o que você gostaria de mudar.

---

## 📝 Licença

Distribuído sob a licença MIT. Veja LICENSE para mais detalhes.

---

## 🔗 Créditos

Baseado em FastMCP e bibliotecas open-source da comunidade Python.