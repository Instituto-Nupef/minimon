#!/bin/bash

# Instalação do Zerotier
echo "Instalando Zerotier..."
curl -s https://install.zerotier.com | sudo bash

# Instalação do Docker e Docker-compose
echo "Instalando Docker e Docker-compose..."
apt-get update
apt-get install -y ca-certificates curl gnupg fail2ban

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

echo "Instalação concluída!"

# Pilha Serviço de monitoramento
echo "Clonando repositório do projeto..."
git clone https://github.com/Instituto-Nupef/minimon.git

echo "Acessando pasta e iniciando containers..."
cd minimon/

# Verificar se o container já está em execução
if docker-compose ps | grep -q "Up"; then
    echo "O container já está em execução."
else
    echo "O container não está em execução. Iniciando container..."
    docker-compose up -d
fi

echo "A instalação e configuração estão concluídas."
echo "Para conectar esta máquina virtual ao Zerotier, execute o seguinte comando:"
echo "zerotier-cli join XXXXXXXXXXXXXXX"
echo "Substitua XXXXXXXXXXXXXXX pelo ID da rede do Zerotier."