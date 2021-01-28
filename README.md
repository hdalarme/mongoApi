# web crawler com Ruby on Rails e MongoDB

## Conteúdo

1. [Sobre](#sobre-a-api)
2. [Dependencias](#dependencias)
3. [Funcionalidades](#funcionalidades)

## Sobre a API

 A API foi construida para resolver o desafio de realizar um [web crawler](https://pt.wikipedia.org/wiki/Rastreador_web) que busca as frases do site [http://quotes.toscrape.com/](http://quotes.toscrape.com/).

## Dependencias

Gem usadas

[mongoid](https://github.com/mongodb/mongoid)  
[kimurai](https://github.com/gitter-badger/kimurai)  
[active_model_serializers](https://github.com/rails-api/active_model_serializers)  
[devise](https://github.com/heartcombo/devise)  
[simple_token_authentication](https://github.com/gonzalo-bulnes/simple_token_authentication)  

As gems "device" e "simple_token_authentication" foram utilizadas para realizar a gestão de acesso. Sendo a gem "device" responsável pelo cadastro e login dos usuários e a gem "simple_token_authentication" responsavel por gerenciar o token de acesso.

A gem "mongoid" foi utilizada para consistir os dados no MongoDB

A gem "active_model_serializers" foi utilizada para serializar o retorno da API realizando a formatação do json

A gem "kimurai" foi utilizada para crawlear o site e extrair as informações a serem persistidas no banco de dados

## Funcionalidades

Foram desenvolvidas as funções "index", "scrape", "search", "create" e "update" no controller Quote,  alem das funcionalidades responsaveis pelo registro no controller Registrations e login no contoller Session do usuário.

Para ter acesso a API o usuário tem que realizar o cadastro de seu usuário enviando no corpo da requisição POST para /sign_up as informações de nome, login, senha e confirnação de senha. Já a requisição para POST /sign_in deve ser enviado no corpo as informações de e-mail e senha que ira retornar a token que será usado nas demais funcionalidades

Se enviarmos uma requisiçao GET para /quote ou para / passando no Header o e-mail e o token teremos a lista de todas as frases que estão no banco de dados.

Para realizar o crawler podemos fazer uma requisição POST para /quotes/scrape que será resposavel por acessar o site e coletar as informações das frases.

Também podemos fazer uma requisição GET para /quote/{SEARCH_TAG} que realizar o crawler na pagina e depois exibe todas as frases com a tag enviada na requisição.