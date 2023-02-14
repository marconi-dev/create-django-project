nome_do_projeto=$1
create_project() {
  [[ $nome_do_projeto ]] || read -p "Nome do projeto: " nome_do_projeto
  django-admin startproject $nome_do_projeto
}

create_app() {
  read -p "Nome do app: " nome_do_app
  cd $nome_do_projeto
  python manage.py startapp $nome_do_app
  cd ..
}
