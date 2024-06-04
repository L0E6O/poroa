FROM ubuntu:latest

# Aggiorna e installa le dipendenze (opzionale, ma buona pratica)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Comando da eseguire all'avvio del container
CMD echo "funziona"