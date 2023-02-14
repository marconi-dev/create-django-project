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
    
    #${app_name^}
    '${app_name}.apps.${app_name^}Config',
]"
}

rootconf() {
  echo -e "\n\nROOT_URLCONF = '$project_name.urls'"
}

wsgiconfig() {
  echo -e "
WSGI_APPLICATION = '$project_name.wsgi.application'
"
}

set_settings() {
  declare -A settingsFile
  settingsFile[0]=~/bin/django-scripts/modules/settings/settings01.txt
  settingsFile[1]=~/bin/django-scripts/modules/settings/settings02.txt
  settingsFile[2]=~/bin/django-scripts/modules/settings/settings03.txt
  settingsFile[3]=~/bin/django-scripts/modules/settings/settings04.txt

  cd $project_name

  cat ${settingsFile[0]}  > $project_name/settings.py
  instaled_apps          >> $project_name/settings.py
  cat ${settingsFile[1]} >> $project_name/settings.py
  rootconf               >> $project_name/settings.py
  cat ${settingsFile[2]} >> $project_name/settings.py
  wsgiconfig             >> $project_name/settings.py
  cat ${settingsFile[3]} >> $project_name/settings.py

  cd ..
}
