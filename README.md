# minimon - Mesh monitoring stack
Stand alone version of graunamon - a grauninha component.

---

### Pilha de monitoramento de redes mesh

Versão para uso em redes de alta velocidade ou host único

Versao separada do graunamon - um componente do grauninha [1]

---

### Pilha preparada para:

* Influxdb recebe conexões dos roteadores na porta 25826 via UDP atraves de rede zerotier e fornece acesso via 8086 TCP.

* Grafana recebe conexões na porta 3000 e conecta no ip do host em 8086 para acesso ao influx.



[1] http://local.grauna.org.br



---
# Instalação de servidores de monitoramento
## Requisitos de Hardware

* 20 GB HD 
* 2 GB Ram 
* 2 VCPU

## Portas a serem liberadas em firewall
* Entrada WAN
    * 22 - SSH
    * 80 - http
    * 443 - https
    * 3000 - Grafana
    * 9993 - Zerotier
## Instação de Dependencias na VM
* Zerotier
* Docker
* Docker-compose
### Zerotier
``` 
curl -s https://install.zerotier.com | sudo bash 
```
### Docker e Docker-compose
```
apt-get update
apt-get install ca-certificates curl gnupg
```

```
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpgapt-get update
apt-get install ca-certificates curl gnupg
```

```
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
```

```
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
apt-get install docker-compose -y
```

## Pilha Serviço de monitoramento
Clonar repositório git do projeto
```
git clone https://github.com/Instituto-Nupef/minimon.git
```

Acessar pasta e iniciar container's
```
cd minimon/
```

```
docker-compose up -d
```

Conectar VM a uma rede zerotier ondese conectará aos roteadores
```
zerotier-cli join XXXXXXXXXXXXXXX
```
