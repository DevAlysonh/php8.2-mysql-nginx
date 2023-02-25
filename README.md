# php8.2-mysql-nginx
Ambiente de desenvolvimento com PHP8.2 + MYSQL + NGINX + COMPOSER | Usando Docker (Voltado para estudo, e prática)

*É necessário ter o docker instalado na máquina, e ter alguma noção de como utilizar esta ferramenta. Se você não a possui, pode conferir sobre o docker neste link: https://www.docker.com/get-started/*

#### 1- Primeiro clone o repositório usando o comando:
```
git clone git@github.com:DevAlysonh/php8.2-mysql-nginx.git <seu-projeto>
```

#### 2 - Mude para a branch php8.2-mysql-nginx-composer:
```
git checkout php8.2-mysql-nginx-composer
```

#### 3- Use o comando a seguir para remover o versionamento, para que você possa criar seu próprio repositório a partir desse ambiente;
```
rm -rf .git
```

#### 4- Copie o arquivo .env.example -> .env | e adicione o nome da base de dados que deseja usar, e a senha para o usuário root:
```
cp .env.example .env
```
```
MYSQL_ROOT_PASSWORD= minhaSenha
MYSQL_DATABASE= meuDb
```

#### 5- Configure a porta que deseja usar para o serviço do NGINX:
```
  nginx:
    ports:
      - "8989:80"
```
*Talvez você tenha algum outro servidor rodando na sua máquina, e isso pode gerar alguns conflitos com as portas. Por isso eu gosto de usar a porta 8989 da minha máquina para executar o servidor nginx, você pode escolher uma de sua preferência ou usar a padrão que é: 80:80*

#### 6- Configure a porta que deseja usar para o serviço do MYSQL:
```
  mysql:
    ports:
      - "13306:3306"
```
*Talvez você tenha algum outro servidor mysql rodando na sua máquina, como o phpmyadmin por exemplo, e isso pode gerar alguns conflitos com as portas. Por isso eu gosto de usar a porta 13306 da minha máquina para executar o serviço do mysql, você pode escolher uma de sua preferência ou usar a padrão que é: 3306:3306*

### Agora temos tudo pronto para subir nossos containers e começar a programar.

*Execute o comando:*
```
docker-compose up -d
```
*Ele irá construir nossos containers, e executar os comandos listados no Dockerfile, para configurar nosso ambiente com algumas extensões do php, e também já com o composer disponível no nosso container "meu-app".*

*Se tudo ocorreu bem, você já pode acessar seu http://localhost na porta que configuramos no serviço do nginx. No nosso caso, a porta: **8989**, então nosso endereço local é: http://localhost:8989*

*Ao acessar, você deverá ser capaz de ver a execução do phpinfo().*

#### Conexão com o DB:

*Basta acessar o seu gerenciador preferido, no meu caso gosto de usar o Dbeaver. Basta criar uma nova conexão passando como parâmetros o nome da database que você definiu no arquivo .env, a senha que você também definiu lá, e o host + porta para conexão. No nosso caso seria localhost, **13306**.
Se você não tem este software instalado na sua máquina, pode ver como o instalar neste link: https://dbeaver.io/download/*

## Todo o seu código php deve estar dentro da pasta src, que foi para onde mapeamos os volumes dos nossos containers.

*Pronto, agora está tudo pronto para você colocar seus estudos em prática, sem precisar instalar nenhuma dependência na sua máquina. Lembrando que você pode instalar outras extensões do php manualmente, caso precise, ou pode até mesmo editar o arquivo Dockerfile para que sejam instaladas automaticamente.*

*O composer está disponível no nosso container do php, então você pode acessar usando um dos dois comandos abaixo:* 

```
docker exec -it meu-app composer -v

//ou pode acessar o bash do container para executar seus comandos php:

docker exec -it meu-app bash
```
