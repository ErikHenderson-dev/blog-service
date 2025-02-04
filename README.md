# Blog Service

Este é um projeto de blog desenvolvido com Ruby on Rails. A API permite que os usuários criem artigos, organizem-nos em categorias e interajam com o conteúdo por meio de comentários.

## Funcionalidades

**Artigos:** Autores podem criar artigos com título, subtítulo e conteúdo.
**Categorias:** Os artigos podem ser organizados em categorias.
**Comentários:** Usuários podem deixar comentários nos artigos, criando interação entre os leitores e autores.

## Pré-requisitos

Antes de rodar a aplicação, certifique-se de ter os seguintes itens instalados:

- **Docker**: Para criar e gerenciar containers de forma fácil e consistente. Você pode instalar o Docker a partir do [site oficial](https://www.docker.com/get-started).
- **Docker Compose**: Para orquestrar multi-containers, usado na configuração da aplicação. Normalmente já vem instalado junto com o Docker

## Instalação

1. **Clone o repositório:**

```
    git clone https://github.com/usuario/nome-do-repositorio.git
```

2. **Abra o terminal e acesse o diretório onde o projeto foi clonado:**
```
    cd /minha-pasta/blog-service
```

3. **Ainda no terminal, rode o comando abaixo:**
```
    docker-compose up
```