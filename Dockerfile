# Usa a imagem oficial do Ruby
FROM ruby:3.0.3

# Define variáveis de ambiente
ENV RAILS_ENV=development \
    RAILS_LOG_TO_STDOUT=true \
    APP_HOME=/blog-service

# Instala dependências
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Cria e define o diretório de trabalho dentro do contêiner
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Instala gems
COPY Gemfile* $APP_HOME/
RUN gem install bundler
RUN bundle install

# Copia o código do projeto para o contêiner
COPY . .

# Expor a porta 3000 para acessar a aplicação Rails
EXPOSE 3000