FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de requisitos (caso exista)
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código da aplicação para dentro do container
COPY . .

# Expõe a porta 8000 (comum no FastAPI)
EXPOSE 8000

# Comando para iniciar o servidor com uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]