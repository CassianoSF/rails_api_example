Windows 10
    - Colocar em modo de desenvolvimendo em "For developers settings"
    - Hábilitar "Windows Subsystem for Linux(Beta)" em "Windows Features"
    - Abra o "bash.exe" no search ou \sistem32
    - Instale o "Ubuntu on Windows" digitando y
    - Abra o "Bash on Ubuntu on Windows"

    - Atualizar
        sudo apt-get update
    
    - Instalar dependencias
        sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

    - Git    
        git config --global color.ui true
        git config --global user.name "YOUR NAME"
        git config --global user.email "YOUR@EMAIL.com"
        ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"

    - Ruby
        cd
        git clone https://github.com/rbenv/rbenv.git ~/.rbenv
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
        echo 'eval "$(rbenv init -)"' >> ~/.bashrc
        exec $SHELL

        git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
        echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
        exec $SHELL

        rbenv install 2.4.2
        rbenv global 2.4.2
        ruby -v
        gem install bundler

    - Rails
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
        sudo apt-get install -y nodejs
        gem install rails -v 5.1.4
        rbenv rehash
        rails -v

    - Projeto
        mkdir meudindin
        cd meudindin
        rails new api --api

    - Estrutura
        rails g scaffold categoria user_id:integer descricao cor
        rails g scaffold tabela user_id:integer descricao
        rails g scaffold despesa valor:float descricao categoria_id:integer data:date tabela_id:integer
        rails g scaffold receita valor:float descricao categoria_id:integer data:date tabela_id:integer
        rake db:migrate

        /app/models/tabela.rb
        class Tabela < ApplicationRecord
          has_many :receita
          has_many :despesas
        end

        /app/models/categorium.rb
        class Categorium < ApplicationRecord
          belongs_to :user
        end

        /app/models/despesas.rb
        class Despesa < ApplicationRecord
          belongs_to :tabela
        end

        /app/models/receita.rb
        class Receita < ApplicationRecord
          belongs_to :tabela
        end

    - Rotas
        /config/routes.rb
          resources :categoria
          resources :tabelas do 
            resources :despesas
            resources :receita
          end

    - Gems
        /Gemfile
          gem 'devise'
          gem 'omniauth'
          gem 'devise_token_auth'
        ----------------------------
        bundle install
        rails g devise_token_auth:install User auth
        rake db:migrate

        /app/models/user.rb
        ...
          has_many :categoria
          has_many :tabelas
        ...

    - Controllers
        Amarrar relacionamentos com o current_user


