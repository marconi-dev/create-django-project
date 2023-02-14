instaled_apps() {
  echo -e "\n
# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framwork',
    
    #${nome_do_app^}
    '${nome_do_app}.apps.${nome_do_app^}Config',
]"
}

rootconf() {
  echo -e "\n\nROOT_URLCONF = '$nome_do_projeto.urls'"
}

wsgiconfig() {
  echo -e "
WSGI_APPLICATION = '$nome_do_projeto.wsgi.application'
"
}

set_settings() {
  declare -A settingsFile
  settingsFile[0]=~/bin/django-scripts/modules/settings/settings01.txt
  settingsFile[1]=~/bin/django-scripts/modules/settings/settings02.txt
  settingsFile[2]=~/bin/django-scripts/modules/settings/settings03.txt
  settingsFile[3]=~/bin/django-scripts/modules/settings/settings04.txt

  cd $nome_do_projeto

  cat ${settingsFile[0]}  > $nome_do_projeto/settings.py
  instaled_apps          >> $nome_do_projeto/settings.py
  cat ${settingsFile[1]} >> $nome_do_projeto/settings.py
  rootconf               >> $nome_do_projeto/settings.py
  cat ${settingsFile[2]} >> $nome_do_projeto/settings.py
  wsgiconfig             >> $nome_do_projeto/settings.py
  cat ${settingsFile[3]} >> $nome_do_projeto/settings.py

  cd ..
}
