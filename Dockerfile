FROM python:3.12-slim

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Definir diretório de trabalho
WORKDIR /app

# Copiar requirements primeiro para cache do Docker
COPY requirements.txt .

# Instalar dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código da aplicação
COPY . .

# Tornar o script executável
RUN chmod +x doc_mcp_tool.py

# Expor porta (embora MCP use stdio, pode ser útil para logs)
EXPOSE 8000

# Comando para executar o servidor
CMD ["python", "doc_mcp_tool.py"]