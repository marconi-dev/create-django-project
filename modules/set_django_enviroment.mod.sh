set_and_active_django_enviroment() {
  python3 -m venv venv && source venv/bin/activate
  pip install djangorestframework
  pip install dj-database-url
}
