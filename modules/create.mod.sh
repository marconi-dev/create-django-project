project_name=$1
create_project() {
  [[ $project_name ]] || read -p "Nome do projeto: " project_name
  django-admin startproject $project_name
}

create_app() {
  read -p "Nome do app: " app_name
  cd $project_name
  python manage.py startapp $app_name
  cd ..
}
