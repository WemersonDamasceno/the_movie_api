# TheMovieDB
<img width="100" src="https://user-images.githubusercontent.com/37156004/178585291-beafcf5e-fa0d-4317-a046-604aa1c30348.JPEG"/>

# Arquitetura 🚀

Esse projeto trabalha com o conceito de arquitetura limpa, separando o projeto em três camadas principais:

- data
- domain
- presentation

![architecture_link]

## Presentation
É a camada de interação com o usuário. Você obviamente precisa de widgets para exibir algo na tela. Esses widgets então despacham eventos para o Bloc ou são acionados por métodos e um Cubit e escutam os estados.

## Domain

Ele conterá apenas a lógica de negócios principal (use cases) e objetos de negócios (entities). Deve ser totalmente independente de todas as outras camadas.

## Data

A camada de "data" consiste em uma implementação de "repository" (o contrato vem da camada de "domain") e "data sources" - uma geralmente é para obter dados "remote" (API) e a outra para armazenar em cache esses dados. O repository é onde você decide se deseja retornar dados atualizados ou armazenados em cache, quando armazená-los em cache e assim por diante.

### O que esta incluso no projeto? 📦


✅&nbsp; [Bloc][bloc_link] - Bloc architecture para código escalável e testável que oferece uma separação clara entre lógica de negócios e apresentação

✅&nbsp; [Testing][testing_link] - Testes Unitários e Widgets

✅&nbsp; [Continuous Integration][github_actions_link] - Lint, format, test, e aplicação de code coverage usando [GitHub Actions][github_actions_link]



[architecture_link]: https://raw.githubusercontent.com/ResoCoder/flutter-tdd-clean-architecture-course/master/architecture-proposal.png
[bloc_link]: https://bloclibrary.dev
[github_actions_link]: https://github.com/features/actions
[testing_link]: https://flutter.dev/docs/testing

# The Movie DB API
A API do <a href="https://developer.themoviedb.org/docs/getting-started">The Movie Database (TMDb)</a>  oferece acesso a informações abrangentes sobre filmes, programas de TV e pessoas associadas a eles, permitindo a criação de uma variedade de aplicativos e serviços relacionados ao cinema. É amplamente utilizada pela sua riqueza de recursos e facilidade de integração.
 
# Telas implementadas
 

https://github.com/WemersonDamasceno/the_movie_api/assets/37156004/2cf140e0-5ff7-4c0d-8b73-f278fabc5479





# Como usar 
Antes de tudo, configure o ambiente Flutter da sua maquina, veja mais em https://flutter.dev/docs/get-started/install

- Faça o clone do repositório:
$ git clone https://github.com/WemersonDamasceno/the_movie_api

- Entre na pasta:
$ cd the_movie_api

- Instale as dependencias:
$ flutter pub get

- Execute o App com o comando: 
$ flutter run


O app pode ser baixado aqui: <a href="https://drive.google.com/file/d/1ZMeDHhdDrAcg66CNDtRjxEZnchV_LDNC/view?usp=sharing">Download aqui!</a>

Made with :heart: and Flutter.
