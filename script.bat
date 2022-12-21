echo "Criando imagens.."

docker build -t alessandroadr/projeto-backend-DIO:1.0 backend/.
docker build -t alessandroadr/projeto-database-DIO:1.0 database/.

echo "Criação de imagens ok"

echo "Push das imagens sendo realizado.."

docker push alessandroadr/projeto-backend-DIO:1.0 backend/.
docker push alessandroadr/projeto-database-DIO:1.0 database/.

echo "Push das imagens ok"

echo "Criando servicos no cluster K8s.."

kubectl apply -f ./services.yml

echo "Realizando deployments.."

kubectl apply -f ./deployment.yml
