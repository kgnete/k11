#!/bin/bash
# chromium --incognito --new-window   \







function .gif.install(){
# para crear gifs
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install -y peek
}



function .gif.run(){
peek
}


function .nodejs.install(){
  #node 
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04
# sudo apt install -y nodejs
# sudo apt install -y npm
sudo apt install curl
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh
bash install_nvm.sh
source ~/.profile
# nvm ls-remote
nvm install v10.14.1
node -v

}


















function .docker.install(){

  # docker
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo usermod -aG docker ${USER}
id -nG

}














# unetbootin
function .unetbootin.install(){
sudo add-apt-repository ppa:gezakovacs/ppa
sudo apt-get update
sudo apt-get install unetbootin
}



function .unetbootin.run(){
# .unetbootin.install
sudo QT_X11_NO_MITSHM=1 /usr/bin/unetbootin
}





















function .git.init(){
echo -e "\033[0;32m borra el .git anterior y crea uno nuevo \033[0m"
rm -rf .git
git init

cat << EEOOFF > .gitignore

# See https://help.github.com/articles/ignoring-files/ for more about ignoring files.

# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*
EEOOFF

}













function .ssh.keygen(){

ssh-keygen -t rsa -C "knyete@gmail.com" -b 4096
# sudo apt install xclip
echo pegar la llave pulica en el servidor remoto
echo ...

cat ~/.ssh/id_rsa.pub

}









function .git.push.kgnete.(){

cat << EEOOFF
la primera vez se debe crear la clave haciendo:
  .ssh.keygen 
  pegar la llave en   https://github.com/kgnete >> menu >> settings  >>   SSH and GPG keys  >>   New SSH key  
EEOOFF





if [ $# -eq 0 ];  then    echo " que repositorio? ";  echo k01 k02 k03 ... k20;  read;fi

git init
echo -e "\033[0;32m add .  ;  commit ; kgnete/ultimo   \033[0m"
# Add changes to git.
# cd .
git add .
# Commit changes.
msg=" comit `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git remote remove origin
# git remote add origin https://github.com/kgnete/"$1"
git remote add origin git@github.com:kgnete/"$1".git
git remote add origin git@github.com:kgnete/k11.git
git remote -v
# read
# Push source and build repos.
# git push origin master --force
git push origin HEAD --force
chromium https://github.com/kgnete/"$1"
# Come Back up to the Project Root
}














function .git.push.kgnete.home(){
cd 
rm -rf .git
git init
# clone solo del .bash_aliases
cat << EEOOFF > .gitignore
*
*/
!.bash_aliases
!bookmarks*
!makefile
EEOOFF
.git.push.kgnete. k01
}











function .git.push.kgnete.react(){
cd ~/0/k00
.git.push.kgnete. k00
}








function .gis.fv(){

terminator -e 'qgis; \
chromium https://www1.sedecatastro.gob.es/Cartografia/mapa.aspx?pest=rc&from=OVCBusqueda&final=&ZV=NO  http://centrodedescargas.cnig.es/CentroDescargas/buscadorCatalogo.do?codFamilia=02122#;  \
bash $SHELL ' &


clear
cat << EEOOFF > /tmp/leeme
cargar el mapa base 
=============================================
OSM
=====
chromium https://mappinggis.com/2016/09/plugin-quickmapservices-capas-base-de-google-landsat-openstreetmap-para-qgis/ &&
# Al igual que el resto de plugins en QGIS, hemos de acceder al menú superior 
Complementos > Administrar e instalar complementos…
# instalar plugin QGIS
# Se abrirá el instalador de plugins. Introduce en el buscador el texto QuickMapServices para localizar el plugin 
y, una vez resaltado, hacemos clic sobre el botón inferior derecha Instalar complemento
Esto descargará el plugin desde el repositorio oficial de QGIS y lo instalará en nuestro equipo.
Para acceder al plugin QuickMapServices tendremos que acceder al botón con el icono de la bola del mundo (muy similar al botón Añadir capa WMS):
GOOGLE mapa
===========
chromium https://mappinggis.com/2018/03/como-anadir-mapas-base-en-qgis-3-0-openstreetmap-google-carto-stamen/#Anadir_capas_de_Google_Maps_en_QGIS_3 &
Dentro del panel Navegador buscamos la conexión XYZ Tiles y hacemos clic con el botón derecho del ratón “New Connection”.
Google Maps: https://mt1.google.com/vt/lyrs=r&x={x}&y={y}&z={z}
Google Satellite: http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}
Google Hybrid: https://mt1.google.com/vt/lyrs=y&x={x}&y={y}&z={z}
Google Terrain: https://mt1.google.com/vt/lyrs=t&x={x}&y={y}&z={z}
Google Traffic: https://mt1.google.com/vt?lyrs=h@159000000,traffic|seconds_into_week:-1&style=3&x={x}&y={y}&z={z}
Google Roads: https://mt1.google.com/vt/lyrs=h&x={x}&y={y}&z={z}

coger la referencia catastral de lka parcela
=============================================
cargar la capa del mapa vectorial (mucho mejor para trabajar ofline) 
=============================================
# buscar /busqueda por listado / mapas vectoriales y BCT / BTN25  || R.CATASTRAL (BUSCAR) 7840426VG8174B   9888101UF6598N  
# como resultado devuelve 33089.zip / Descagar , descomprimir y arrastrar a qgis los ficheros , los mas importantes los de mas pes

# rectangulos
plugin  Rectangles Ovals Digitizing

===============

# exportar con latitud y longitud
cambiar CRS a  EPSG:4326 al dar boton derecho sobre las capas save as


EEOOFF

cat /tmp/leeme

}




function .qgis(){
chromium https://www.qgis.org/es/site/
  sudo apt-get install qgis-server python-qgis
  sudo apt install qgis

}









function .git.push.kgnete.jupyter(){
cd /home/pk/0_docker_jupyter/k02
cat << EEOOFF > .gitignore
.*
.*/
./.ipynb_checkpoints
EEOOFF
.git.push.kgnete. k02
}










function .gh.repo.delete(){

# coger el token de https://github.com/settings/tokens/new marcando delete repo
token="supersecret"
# lista de los reposcitorios
curl -H "Authorization: token ${token}" https://api.github.com/user/repos?affiliation=owner | grep git_url | sed -r 's/(    "git_url": "git:\/\/github.com\/)//' | sed -r 's/.git",//'  > url_list.txt
# borra todos los repositoris (!!!! meter el token directamente si no funciona)
while read r;do curl -XDELETE -H 'Authorization: token \${token}' https://api.github.com/repos/$r ;done < url_list.txt
rm url_list.txt

}






alias .gh="
chromium  \
https://github.com/kgnete \
https://github.com/knyete \
https://github.com/asolear \
https://github.com/broncelec \
https://github.com/chachypiruli \
https://github.com/electrocasa/ \
https://github.com/prglinux/

"


alias .gh.ayuda="
chromium  \
https://jekyllrb.com/ \
https://pages.github.com/ \
https://help.github.com/categories/github-pages-basics/ \
https://github.com/jekyll/jekyll/wiki/Themes \
"




alias .gh.pages.ver="
# pkill chromium

chromium  \
https://broncelec.github.io/ \
https://asolear.github.io/ \
https://electrocasa.github.io/ \
https://kgnete.github.io/ \
https://knyete.github.io/ \
https://chachypiruli.github.io/ \
https://prglinux.github.io/ \

&


"






function .gh.pages.clone(){

cd
if [ ! -d "0-gh-pages" ]; then  mkdir 0-gh-pages;fi
# 
cd ~/0-gh-pages
if [ $# -eq 0 ];  then    echo " ususario github ? ";  ls -l;  read;fi
if [ ! -d "$1".github.io ]; then  git clone  https://github.com/"$1"/"$1".github.io.git/;fi


code ~/0-gh-pages
}






function .gh.pages.push(){
cd ~/0-gh-pages
if [ $# -eq 0 ];  then    echo " que page ? ";  ls -l;  read;fi
cd "$1".github.io
# git init
git add .
git commit -m "con script"
# git remote add origin https://github.com/broncelec/broncelec.github.io
# git remote add origin http://192.168.0.154:3080/pk/ultimo.git
# git submodule add -b master https://github.com/broncelec/broncelec.github.io.git public 
# git push -u origin master --force
git push
}








function .vnc(){
sudo apt list --installed | grep remmina
sudo apt install remmina

# junto con la aplicacion android  bVNC
sudo apt install x11vnc

}




function .npm.install.echarts(){
npm install --save echarts-for-react
# ojo que hoay que instalar tambien
npm install echarts --save
chromium https://www.npmjs.com/package/echarts-for-react 

}






 












function .npm.install.graphql-apollo(){
npm i -S apollo-boost react-apollographql-tag graphq
# para crear un servidor
chromium https://www.apollographql.com/docs/apollo-server/v1/
}


















function .install.node(){
  sudo apt install -y curl

curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -

# ## Run `sudo apt-get install -y nodejs` to install Node.js 10.x and npm
# ## You may also need development tools to build native addons:
#      sudo apt-get install gcc g++ make
# ## To install the Yarn package manager, run:



sudo apt install -y nodejs
# yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn


}









function .npm.list.installed(){
echo global -----------------
  ls `npm root -g`
npm list -g --depth=0
echo local --------------------
npm list --depth=0

}



function .apt.list.installed(){
apt list --installed
}






function .graphcool.install(){
echo pk | sudo -S npm install -g graphcool

}




function .github(){
curl -u "kgnete" https://api.github.com

}












function .surge.install(){
chromium https://surge.sh/
echo pk | sudo -S npm install --global surge

}








function .deploy.surge(){
# <project> <domain>
cd ~/0-react/
if [ $# -eq 0 ];  then    echo "uso uso .deploy.surge <proyecto> <sito>  EJEM .deploy.surge rmw cp1 ";  ls -l;   read;fi
cd ~/0-react/"$1"
if [ ! -d "build" ]; then  npm run build;fi
cd ~/0-react/"$1"/build 
#  surge <project> <domain>
surge . "$2".surge.sh
# y luego en 
chromium http://"$2".surge.sh/
}

















function .surge.login(){
cat << EEOOFF
... email usuarios

mercedesruizortiz@gmail.com
pacoromangamez@gmail.com
kgnete@gmail.com
knyete@gmail.com
prglinux@gmail.com
chachypiruli@gmail.com

abrira el chome con los sitios

EEOOFF

surge login
surge list
chromium --new-window  $(surge list |  awk -F[ '{print substr($5,4)}')
}
















function .surge.list(){
  # usuario dominio
surge list
chromium --new-window  $(surge list |  awk -F[ '{print substr($5,4)}')
}













function react.charts.1(){
chromium --incognito --new-window   \
https://github.com/apexcharts/react-apexcharts \
https://github.com/codefacebook/react-chartjsx

}











function .vue.(){
chromium --incognito --new-window   \
https://cli.vuejs.org/guide/prototyping.html
	
}


function .firebase.(){
chromium --incognito --new-window   \
https://broncelec.firebaseapp.com



cat << EEOOFF


hofdhoasdf

EEOOFF


read
	
}



























# react
# =========================================================================



alias .react.0.ayuda="
chromium --incognito --new-window   https://github.com/enaqx/awesome-react \
https://github.com/GeekyAnts/NativeBase \
https://facebook.github.io/react-native/docs/webview \
https://codeburst.io/deploy-react-to-github-pages-to-create-an-amazing-website-42d8b09cd4d

"




















# .react.1.cra kgnete kgnete.github.io
function .react.cra(){
cd
if [ ! -d "0-react" ]; then  mkdir 0-react;fi
# 
cd ~/0-react
if [ $# -eq 0 ];  then    echo " app ? ";  ls -l;  read;fi
if [ ! -d "$1" ]; then  npx create-react-app "$1" ;fi
# 
terminator --new-tab -e 'code ~/0-react/'
cd ~/0-react/"$1" 
}














function .deploy.local(){
cd ~/0-react/
if [ $# -eq 0 ];  then    echo " app ? ";  ls -l;  read;fi
cd ~/0-react/"$1"
npm run build
gnome-terminal -- serve -s build

chromium http://localhost:5000 
# y luego en 

}


function .deploy.netlify(){
chromium  https://app.netlify.com/ https://www.netlify.com/blog/2016/07/22/deploy-react-apps-in-less-than-30-seconds/
# npm install -g create-react-app

# create-react-app hello-world
# cd hello-world
# npm run build

npm install netlify-cli -g
netlify deploy
}








function .gh.deploy(){
# se puede desplegar gh-pages

if [ $# -eq 0 ];  then    echo " app ? ";  ls -l;  read;fi
cd ~/0-react/"$1" 
# ========================================================
# parte especifica para publicar en github-pages
# https://github.com/gitname/react-gh-pages
npm install --save gh-pages  
# para modificar config
#  "homepage": "https://kgnete.github.io/website/",
#    "predeploy":"npm run build",
#    "deploy":"gh-pages -d build"

set kgnete k01
sed -i '3i\  "homepage": "http://'$1'.github.io/'$2'",' ./package.json
sed -i '/start/a         "predeploy": "npm run build",' ./package.json
sed -i '/start/a         "deploy": "gh-pages -d build",' ./package.json

rm -rf .git
git init

git remote add origin https://github.com/"$1"/"$2".git
npm run deploy
# chromium --incognito --new-window   https://kgnete.github.io/website/

}






































# odoo 
# ====================================================================================







function .odoo.modulo(){
if [ $# -eq 0 ];  then    echo "modulo ? ";  ls ~/12/addons;  read;fi

docker exec -it 12_web_1 odoo scaffold /mnt/extra-addons/"$1"
cd ~/12/addons
echo pk | sudo -S chmod --recursive 777 *

gnome-terminal -- code .

chromium --incognito --new-window  https://www.odoo.com/documentation/12.0/howtos/backend.html#build-an-odoo

cat << EEOOFF

- crear en[contenedor] con scaffold 
- editarlo desde el [host]
=================================

[host]
code ./"$1"/addons/ 

[contenedor]


terminator --new-tab -e 'docker exec -it 12_web_1 bash'
docker exec -it 12_web_1 odoo scaffold /mnt/extra-addons/a2
docker exec -it 12_web_1 chmod --recursive 777 /mnt/extra-addons/*
echo pk | sudo -S chmod --recursive 777 *

EEOOFF


chromium --incognito --new-window  https://www.odoo.com/documentation/12.0/howtos/backend.html#build-an-odoo


# 
# read
# if [ $# -eq 0 ];  then    echo "modulo ? ";  ls ~/12/addons;  read;fi
# cd ~/12/addons
# if [ ! -d "$1" ]; then  mkdir "$1";fi

# clear


# gnome-terminal -- ranger "$1"

}
















































alias .kt="
pkill gnome-terminal
"

















function .odoo.modulo.holamundo(){
cd ~/12/addons
if [ ! -d "pk-modulo" ]; then  mkdir pk-modulo;fi

clear
cat << EEOOFF



holamundo de un modulo odoo



EEOOFF




cat << EEOOFF > ./pk-modulo/__init__.py 
#############################   __init__.py   #######################################
import pk-holamundo
EEOOFF



cat << EEOOFF > ./pk-modulo/__manifest__.py
#############################   __manifest__.py   #######################################

# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

{
    'name': 'Modulo Hola Mundo',
    'version': '1.0',
    'author': ['prg'],
    'category': 'Tools',
    'summary': 'Ejemplo de un módulo de Odoo',
    'website': 'https://prglinux.github.io/',
    'description': """
Ejemplo de Hola Mundo.
======================
Con este módulo mostraremos como hacer tu primer componente en odoo 9
    """,
    'depends': ['base'],
    'data': [
        'pkhelloworld_view.xml',
    ],
    'installable': True,
    'auto_install': True,
}
EEOOFF















cat << EEOOFF > ./pk-modulo/pkhelloworld.py

##########################       pkhelloworld.py          #############################################

# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from openerp.osv import fields, osv
from openerp.tools.translate import _

class res_partner(osv.osv):
	_name = 'res.partner'
	_inherit = 'res.partner'
	_columns = {
	   'hola' : fields.boolean('Hola'),
	}

res_partner()

EEOOFF













cat << EEOOFF > ./pk-modulo/pk-helloworld_view.xml
##########################      pk-helloworld_view.xml         #############################################

<?xml version="1.0" encoding="utf-8"?>
<openerp>
	 <data>
	 	<record id="inherit_respartner_hola_id" model="ir.ui.view">
	 		<field name="name">res.partner.inherit</field>
	 		<field name="model">res.partner</field>
            <field name="type">form</field>
            <field name="inherit_id" ref="base.view_partner_form"/>
            	<field name="arch" type="xml">
            		<field name="user_id" position="after" >
            			 <field name="hola" string="Hola Mundo:" /> 
                    </field>            	
                </field>
	    </record>
     </data>
</openerp>
EEOOFF


gnome-terminal -- ranger pk-modulo

}












function .radio(){
chromium --incognito --new-window   \
https://www.aliexpress.com/item/HackRF-One-1MHz-to-6GHz-SDR-Platform-Software-Defined-Radio-Development-Board/32809842995.html?spm=a2g0s.13010208.99999999.263.1c813c00YdmmTm \
https://greatscottgadgets.com/sdr/1/ \
	https://github.com/kgnete/gnuradio.git \
	https://pubs.gnuradio.org/index.php/grcon \

}


























function .odoo.tuto(){
chromium --incognito --new-window \
https://github.com/chachypiruli/odoo-10-development-essential-es \
https://github.com/PacktPublishing/Odoo-10-Development-Essentials \
https://github.com/dreispt/todo_app.git \
https://github.com/odoo/docker \
https://github.com/OCA \
https://www.youtube.com/channel/UC-M2sKCGW8CP2CPBsXw2J8g/featured \
https://www.odoo.com/documentation/12.0/howtos/backend.html 


}















#git clone https://github.com/dreispt/todo_app.git -b 10.0



function .bu.odoo(){
if [ $# -eq 0 ]
  then
    echo "pasar argumentos: versionOdoo versionCopia: minimo, base ..."
    echo "-------------------------------------------------"
    ls ~/0-volume-bu/
    read
fi
.bu "$1"_odoo-db-data "$2"
.bu "$1"_odoo-web-data "$2"
}











function .bu.odoo.10(){
.bu 10_odoo-db-data "$1"
.bu 10_odoo-web-data "$1"
}














function .bu.odoo.12(){
.bu 12_odoo-db-data "$1"
.bu 12_odoo-web-data "$1"
}




















function .bu.odoo.11(){
.bu 11_odoo-db-data "$1"
.bu 11_odoo-web-data "$1"
}

















function .odoo.10(){
if [ $# -eq 0 ]
  then
    echo "pasar argumento ultima parte del nombre: minimo, base ..."
    echo "-------------------------------------------------"
    ls ~/0-volume-bu/10*
    read
fi

echo registrarse con  admin@asolear.es
echo !!!!!!!!!!!!  valeee, poo pulsa intro

.docker.container.rm
.dv.rr

.restore 10_odoo-web-data "$1"
.restore 10_odoo-db-data "$1"

.do.odoo10

# curvas de datos
# 
}












function .odoo.11(){
if [ $# -eq 0 ]
  then
    echo "pasar argumento ultima parte del nombre: minimo, base ..."
    echo "-------------------------------------------------"
    ls ~/0-volume-bu/11*
    read
fi

echo registrarse con  admin@asolear.es
echo !!!!!!!!!!!!  valeee, poo pulsa intro

.docker.container.rm
.dv.rr


.restore 11_odoo-web-data "$1"
.restore 11_odoo-db-data "$1"

.do.odoo11

# curvas de datos
# 
}















function .odoo.12(){
if [ $# -eq 0 ]
  then
    echo "pasar argumento ultima parte del nombre: minimo, base ..."
    echo "-------------------------------------------------"
    ls -l ~/0-volume-bu/12*
    read
fi

echo registrarse con  admin@asolear.es
echo !!!!!!!!!!!!  valeee, poo pulsa intro

.docker.container.rm
.dv.rr

.restore 12_odoo-web-data "$1"
.restore 12_odoo-db-data "$1"

.do.odoo12

# curvas de datos
# 
}















function .odoo.nube(){

	clear
	echo dos sesiones : en la nube ...
	echo registrarse con kgnete@gmail.com
	echo !!!!!!!!!!!!  valeee, poo pulsa intro
	read
	chromium --incognito --new-window   https://kgnete.odoo.com https://www.youtube.com/watch?v=M69H6E0zrRc&list=PL1-aSABtP6ADiS19ruNaA58HghfS06y4x
	
	
}




















function .bu(){
if [ $# -eq 0 ]
  then
    echo "pasar argumento con"
    docker volume ls
    read
fi
cd
if [ ! -d 0-volume-bu ]; then
mkdir 0-volume-bu
fi
docker container run --rm -it \
-v "$1":/volume/ \
-v /home/$USER/0-volume-bu:/backup \
ubuntu tar -cjvf  /backup/"$1"-"$2".tar.gz /volume/

}











function .restore(){
if [ $# -eq 0 ]
  then
    echo "pasar argumento con"
    ls ~/0-volume-bu/
    read
fi
cd
docker run -it --rm -v "$1":/volume -v ~/0-volume-bu:/backup ubuntu \
tar -xvf /backup/"$1"-"$2".tar.gz -C .


}





























function .do.odoo10(){
cd
if [ ! -d "10" ]; then
  mkdir 10
fi
cd 10
cat << EEOOFF > ./docker-compose.yml
version: '2'
services:
  web:
    image: odoo:10.0
    depends_on:
      - mydb
    ports:
      - "8069:8069"
    volumes:
      - odoo-web-data:/var/lib/odoo
      - ./addons:/mnt/extra-addons
    environment:
      - HOST=mydb
      - USER=odoo
      - PASSWORD=myodoo
  mydb:
    image: postgres:10
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_USER=odoo
      - POSTGRES_PASSWORD=myodoo
      - POSTGRES_DB=postgres
    volumes:
      - odoo-db-data:/var/lib/postgresql/data
volumes:
  odoo-web-data:
    driver: local
  odoo-db-data:
    driver: local
EEOOFF
terminator --new-tab -e 'docker-compose up'
sleep 5
chromium --incognito --new-window   http://localhost:8069 http://localhost:8069/web/database/manager http://localhost:5050
terminator --new-tab -e 'docker exec -it 10_web_1 bash'

}








function .do.odoo11(){
cd
if [ ! -d "11" ]; then
  mkdir 11
fi
cd 11
cat << EEOOFF > ./docker-compose.yml
version: '2'
services:
  web:
    image: odoo:11.0
    depends_on:
      - mydb
    ports:
      - "8069:8069"
    volumes:
      - odoo-web-data:/var/lib/odoo
      - ./addons:/mnt/extra-addons
    environment:
      - HOST=mydb
      - USER=odoo
      - PASSWORD=myodoo
  mydb:
    image: postgres:10
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_USER=odoo
      - POSTGRES_PASSWORD=myodoo
      - POSTGRES_DB=postgres
    volumes:
      - odoo-db-data:/var/lib/postgresql/data
volumes:
  odoo-web-data:
    driver: local
  odoo-db-data:
    driver: local
EEOOFF
terminator --new-tab -e 'docker-compose up'
sleep 5
chromium --incognito --new-window   http://localhost:8069 http://localhost:8069/web/database/manager http://localhost:5050
terminator --new-tab -e 'docker exec -it 11_web_1 bash'

}


















function .do.odoo12(){
if [ ! -d "12" ]; then
  mkdir 12
fi
cd 12
cat << EEOOFF > ./docker-compose.yml
version: '2'
services:
  web:
    image: odoo:12.0
    depends_on:
      - mydb
    ports:
      - "8069:8069"
    volumes:
      - odoo-web-data:/var/lib/odoo
      - ./addons:/mnt/extra-addons
    environment:
      - HOST=mydb
      - USER=odoo
      - PASSWORD=myodoo
  mydb:
    image: postgres:10
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_USER=odoo
      - POSTGRES_PASSWORD=myodoo
      - POSTGRES_DB=postgres
    volumes:
      - odoo-db-data:/var/lib/postgresql/data
volumes:
  odoo-web-data:
    driver: local
  odoo-db-data:
    driver: local
EEOOFF
terminator --new-tab -e 'docker-compose  up'
sleep 10
terminator --new-tab -e 'docker exec -it 12_web_1 bash'


chromium --incognito --new-window   http://localhost:8069 http://localhost:8069/web/database/manager http://localhost:5050


}
















alias .docker.container.run.portainer="
docker run -d \
-p 8080:80 \
-p 9000:9000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer-data:/data
-e --no-auth \
--name portainer \
--restart always \
portainer/portainer \
--no-auth
chromium --incognito --new-window   \
https://portainer.readthedocs.io/en/latest/index.html \
http://localhost:9000

"




function .r(){

gnome-terminal -- ranger "$1"

}










function .do.redis(){
cd
cat << EEOOFF > docker-compose.yml
version: '2'
services:
  redis:
    container_name: redis
    hostname: redis
    image: redis
    command: redis-server --appendonly yes
    volumes:
      - redis-data:/data
  redis-commander:
    container_name: redis-commander
    hostname: redis-commander
    image: rediscommander/redis-commander
    restart: always
    environment:
    - REDIS_HOSTS=local:redis:6379
    ports:
    - "8081:8081"
volumes:
  redis-data:

EEOOFF
terminator --new-tab -e "docker-compose up" &
chromium --incognito --new-window   http://localhost:8081/
	
}







# comentarios con micro editor
# press [Crtl + E]
# plugin install comment
# resetear
# comentar >>> alt+/





alias .docker.container.run.redis="
chromium --incognito --new-window   https://redis.io/ \
http://try.redis.io/ \
https://app.redislabs.com/#/bdbs  \
https://redis.io/topics/rediscli \
https://app.redsmin.com/


docker run --name redis -p 6379:6379 -d -v vol-redis:/data redis redis-server --appendonly yes


# sudo npm install -g redis-commander
terminator --new-tab -e 'redis-commander'
chromium --incognito --new-window   http://localhost:8081/



terminator --new-tab -e 'docker exec -it redis redis-cli'


# 
# docker exec -it redis redis-cli incr mycounter >> /tmp/pp.txt
# cat /tmp/pp.txt

"























function .no.android.enubuntu(){
#How to mirror android screen on Ubuntu using ADB
chromium --incognito --new-window   https://hub.docker.com/r/sorccu/adb/
docker run -d --privileged -v /dev/bus/
/dev/bus/usb --name adbd sorccu/adb
		
}







function .rethinkdb(){
#la idea es adaptar api firebase a rethink
chromium --incognito --new-window   https://hub.docker.com/_/rethinkdb/
docker run --name some-rethink -v "$PWD:/data" -d rethinkdb
chromium --incognito --new-window   "http://$(docker inspect --format \
  '{{ .NetworkSettings.IPAddress }}' some-rethink):8080"
}




function .mooc.coursera(){

	ls
}



# react native
# ====================================================

alias .react.native.tuts="
chromium --incognito --new-window   \
https://www.quora.com/How-do-I-integrate-iframes-in-React-Native-platform \
/media/pk/TUTORIALES/ \
"





alias .react.native.ayuda="
chromium --incognito --new-window   \
https://facebook.github.io/react-native/docs/getting-started.html \
https://github.com/jondot/awesome-react-native \
https://expo.io/ \
https://snack.expo.io/ \

"


alias .react.native.expo.install="
echo pk | sudo -S npm install expo-cli --global
"



alias mm="
micro"


function  .react.native.expo.create(){
if [ ! -d "$1" ]; then
expo init "$1" 
fi
cd "$1"
expo start
}



function .react.native.expo.build(){
chromium --incognito --new-window   https://docs.expo.io/versions/latest/distribution/building-standalone-apps

#app.json
#,
#        "android": {
#          "package": "com.asolear.mrr"
#        }


expo build:android
}


function .react.native.expo.create.webview(){
cat << EEOOFF > App.js
#para apk con portal de odoo corriendo en oangepi local
import React from 'react';
import { WebView } from 'react-native';

export default class App extends React.Component {
  render() {
    return (
      <WebView
        source={{uri: 'http://kgnete-33248.portmap.io:33248'}}
        style={{marginTop: 20}}
      />
    );
  }
}
EEOOFF


	
}





alias .firebase.="
chromium --incognito --new-window   https://console.firebase.google.com/
"























































#python -m SimpleHTTPServer; \
#npm install http-server -g; \
alias .pg.tuto="
terminator --new-tab -e ' \
cd /home/pk/Downloads/tuto; \
http-server \
'
"


alias .pg.postgres0="
docker run -d \
-p 5432:5432 \
-e POSTGRES_USER=pk \
-e POSTGRES_PASSWORD=pk \
-e POSTGRES_DB=postgres \
--name db postgres:10


chromium --incognito --new-window   https://hub.docker.com/r/fenglc/pgadmin4/ https://hub.docker.com/_/odoo/

pgadmin4 &
.pg.psql
"






alias .pg.pgadmin.app="
#no como docker si reconoce localhost y se puede importar y exportar bbdd
chromium --incognito --new-window   https://wiki.postgresql.org/wiki/Apt
sudo apt-get install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-10 pgadmin4
"





alias .pg.pgadmin0="
docker run --name pgadmin \
           --link db:postgres \
           -p 5050:5050 \
           -d chorss/docker-pgadmin4
chromium --incognito --new-window   http://localhost:5050
echo pgadmin4@pgadmin.org
echo admin 
echo ------------------
echo host a meter
docker inspect db | grep IPAddress


"


function .pg.psql(){
docker exec -it  "$1" psql --dbname=postgres --host=172.17.0.2 --user=pk --password --port=5432
#terminator --new-tab -e 'docker exec -it  db psql --dbname=postgres --host=172.17.0.2 --user=pk --password --port=5432'

}



#COPY persons(first_name,last_name,dob,email) FROM '~/people.csv' DELIMITER ',' CSV HEADER;

alias .pg.ejemplo="
chromium --incognito --new-window   https://dev.mysql.com/doc/index-other.html https://dev.mysql.com/doc/sakila/en/sakila-installation.html
"




alias .pg.todo="
.pg.ejemplo    
.pg.postgres0  
.pg.pgadmin0   
.pg.psql       

"




































alias .ap.synfig="
chromium --incognito --new-window   https://www.freepik.es/
"





alias .docker.container.run.p1="


terminator --new-tab -e ' 
docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
docker run --name some-pgadmin4 \
           --link some-postgres:postgres \
           -p 5050:5050 \
           -d fenglc/pgadmin4 \
'
terminator --new-tab -e '
echo user: pgadmin4@pgadmin.org password: admin
read
chromium --incognito --new-window   https://hub.docker.com/r/fenglc/pgadmin4/ https://hub.docker.com/_/postgres/
bash
'
"



# docker run --rm -v "$(pwd):/src" jekyll/jekyll build



alias .docker.container.run.jekyll.nuevo="
.docker.container.rm
cd && echo pk | sudo -S rm -rf --force  ~/site_old 
mv ~/site ~/site_old 
mkdir ~/site && cd ~/site
sleep 5
terminator --new-tab -e 'docker run -p 80:4000 -v $(pwd):/site -e JEKYLL_NEW=true --name jekyll bretfisher/jekyll-serve; $BASH'

echo pk | sudo -S code .
firefox --new-window http://localhost/
"





function .b.terminator(){
terminator \
 -x \
 /bin/bash -c 'ls; read'
     
}



alias dc="docker-compose up"
alias dcd="docker-compose down"

function parametros(){
ARG1=${1:-foo}
ARG2=${2:-bar}
ARG3=${3:-1}
ARG4=${4:-$(date)}

echo "$ARG1"
echo "$ARG2"
echo "$ARG3"
echo "$ARG4"
}


# para navegar con una ip diferente
alias .vpn.ip.cambio="
# en el sitio
firefox --new-window https://www.vpnbook.com/ &

# descargar la configuracion del servidor vpn
wget https://www.vpnbook.com/free-openvpn-account/VPNBook.com-OpenVPN-FR1.zip

#descomprimirlo
unzip -a VPNBook.com-OpenVPN-FR1.zip

# solo para ver la ip publica y conprobar como cambbia
wget http://ipecho.net/plain -O - -q ; echo


# clave que pedira
echo vpnbook **** mirarala en la pagina, va cambiando

sudo openvpn --config vpnbook-fr1-tcp80.ovpn 


"






alias .docker.container.run.postgres1="
docker run -p 5432:5432 \
--name postgres -e POSTGRES_PASSWORD=pk \
-d postgres



docker run -p 80:80 \
--link postgres:postgres \
-e 'PGADMIN_DEFAULT_EMAIL=pk@pk.pk' \
-e 'PGADMIN_DEFAULT_PASSWORD=pk' \
-d dpage/pgadmin4


sleep 2
terminator --new-tab -e 'echo password pk; \
docker run -it --rm --link some-postgres:postgres postgres psql -h postgres -U postgres'
chromium --incognito --new-window   http://localhost https://hub.docker.com/_/postgres/ https://hub.docker.com/r/dpage/pgadmin4/


echo -------------------------
echo 
echo al agregar nuevo servidor /conexion 
echo NOmbre/Direccionde servidor 172.17.0.2 
echo usuario postgres 
echo conrasena pk

"




function ppp(){

docker run -p 80:80 \
-e 'PGADMIN_DEFAULT_EMAIL=pk@pk.pk' \
-e 'PGADMIN_DEFAULT_PASSWORD=pk' \
-d dpage/pgadmin4
	
}






function .dt.postgres2(){
cat << EEOOFF > ~/stack.yml
version: '3.1'
services:
  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_PASSWORD: example

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080
EEOOFF

#terminator --new-tab -e 'docker stack deploy -c stack.yml'
terminator --new-tab -e 'docker-compose -f stack.yml up'
sleep 5
chromium --incognito --new-window   http://localhost:8080 


}















function .dt.md(){
cat << EEOOFF > ./docker-compose.yml
version: '3'
services:
  database:
    image: postgres:9.6-alpine
    environment:
      - POSTGRES_USER=hackmd
      - POSTGRES_PASSWORD=hackmdpass
      - POSTGRES_DB=hackmd
    volumes:
      - database:/var/lib/postgresql/data
    networks:
      backend:
    restart: always
  app:
    image: hackmdio/hackmd:1.2.0
    environment:
      - HMD_DB_URL=postgres://hackmd:hackmdpass@database:5432/hackmd
    ports:
      - "3000:3000"
    networks:
      backend:
    restart: always
    depends_on:
      - database
  pga:
    image: chorss/docker-pgadmin4
    ports:
      - "5050:5050"
    networks:
      backend:
    restart: always
    depends_on:
      - database
networks:
  backend:
volumes:
  database:
EEOOFF
docker stack deploy --compose-file docker-compose.yml hmd
}




































































































# Using OpenVPN tunnel
# 
#     Install OpenVPN software
#     generar  y Download configuration file desde el menu configuration file
#     Create a mapping rule
#     Start OpenVPN tunnel using the file
#     openvpn --config knyete.first.ovpn
alias .vpn.kgnete="
echo la pagina web cambiar en mapping rules acitions edit el puerto de la aplicacion
terminator --new-tab -e 'echo pk | sudo -S openvpn --config ~/kgnete.first.ovpn'
chromium --incognito --new-window   http://kgnete-33248.portmap.io:33248/ https://portmap.io/
"





alias .vpn.knyete="
echo la pagina web cambiar en mapping rules acitions edit el puerto de la aplicacion
terminator --new-tab -e 'echo pk | sudo -S openvpn --config ~/knyete.first.ovpn'
chromium --incognito --new-window   http://knyete-30955.portmap.io:30955
"






alias .solar.normativa="
chromium --incognito --new-window   \
http://www.f2i2.net/legislacionseguridadindustrial/rebt_guia.aspx \
http://www.idae.es/tecnologias/energias-renovables/uso-electrico/solar-fotovoltaica \
https://suelosolar.com/

"









alias .solar.tiendas="
firefox --new-window \
http://solareurope.es/servicios/ \
https://www.gogreensolar.com/ \
https://www.energias-renovables.com/fotovoltaica \
https://fusionenergiasolar.es/ \
https://floridasolardesigngroup.com/ \

"







alias .www.md.editor="
firefox --new-window \
https://stackedit.io/ \
https://hackmd.io/ \
https://www.datavizforall.org/github/fork-leaflet/
"









alias .www.fotos="
firefox --new-window \
https://pxhere.com \
https://pixabay.com/en/
"






alias .namecheap="
chromium \
http://www.namecheap.com/ \
http://www.asolear.com/ \
http://www.asolear.es/ \
http://www.broncelec.com/ \
http://www.broncelec.es/ \
http://www.electro.casa/ \
https://www.blogger.com \




"

alias .www="
firefox  &
pkill firefox &
.www.namecheap \
.www.blog \
"














alias .gif.run="
peek
"





alias .docker.container.run.drawio="
docker run -it --rm --name=draw -p 8081:8080 -p 8443:8443 fjudith/draw.io 

sleep 3 
firefox --new-window --no-remote http://localhost:8081
"








alias .docker.container.run.syncthing="
docker run -d \
  --restart always \
  --name=syncthing \
  -v /home/pk/zz:/config/Sync \
  -v /home/pk/0:/config/0 \
  -e PGID=1000 -e PUID=1000  \
  -e UMASK_SET=022 \
  -p 8384:8384 \
  -p 22000:22000 \
  -p 21027:21027/udp \
  linuxserver/syncthing && \
sleep 3 && \
firefox --no-remote http://localhost:8384/
"






# //////////    .git.    ////////////////////////////////////////////////
# /////////////////    .git.    /////////////////////////////////////////
# /////////////////////////    .git.    /////////////////////////////////



function .git.config(){
git config --global user.name "pk"
git config --global user.email "pk@pk.pk"
git config --global credential.helper cache
}




function .git.branch.delete(){
  if [ $# -eq 0 ];  then    echo " que rama borro ? ";  git branch;  read;fi
  git branch -D "$1"
}


function .git.checkout(){
  if [ $# -eq 0 ];  then    echo " como se llama la nueva rama ? ";    read;fi

git checkout -b "$1"

}



function .git.push.clarinete(){
if [ $# -eq 0 ];  then    echo " que repositorio? ";  echo c01 c02 c03 ... c20;  read;fi

echo -e "\033[0;32m add .  ;  mercedes  , sdcrmmmm1   \033[0m"
# Add changes to git.
git add .
# Commit changes.
msg=" comit `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git remote remove origin
git remote add origin https://github.com/clarinete/"$1"

# Push source and build repos.
# git push origin master --force
git push origin HEAD --force
chromium https://github.com/clarinete/"$1"
# Come Back up to the Project Root
}




function .git.push.alias(){
cd /home/pk/0bash.aliases
rm -rf .git
git init
git add .
git commit -m "con script"
git remote add origin https://github.com/kgnete/bash_aliases.git
git push -u origin master --force
}





























alias .docker.container.run.stackedit="
docker run -d \
--restart always \
--name stackedit \
-p 8080:8080 \
benweet/stackedit 
sleep 1
firefox http://localhost:8080/
"



alias .docker.container.run.dillinger="
docker run -d \
--restart always \
--name dillinger \
-p 8080:8080 \
joemccann/dillinger:3.30.3
sleep 1
firefox http://localhost:8080/
"




alias .dsc.portainer=" 
docker service create \
    --name portainer \
    --publish 9000:9000 \
    --replicas=1 \
    --constraint 'node.role == manager' \
    --mount type=bind,src=/home/pk/0/0_portainer,dst=/data \
    portainer/portainer
"















function ds.traefik(){
docker service create \
    --name traefik \
    --constraint=node.role==manager \
    --publish 80:80 \
    --publish 8080:8080 \
    --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
    --network traefik-net \
    traefik \
    --docker \
    --docker.swarmMode \
    --docker.domain=$HOSTNAME \
    --docker.watch \
    --api
}

















function .docker.build.nodered(){
cd
if [ ! -d "/home/pk/0-dockerfiles" ]; then  mkdir /home/pk/0-dockerfiles;fi

cat << EEOOFF > /home/pk/0-dockerfiles/dockerfile
# FROM arm64v8/node
# FROM arm32v7/node
FROM node
RUN mkdir -p /usr/src/nr

# User data directory, contains flows, config and nodes.
RUN mkdir /data
WORKDIR /usr/src/nr
# Add node-red user so we aren't running as root.
RUN useradd --home-dir /usr/src/nr --no-create-home node-red \
    && chown -R node-red:node-red /data \
    && chown -R node-red:node-red /usr/src/nr

USER node-red
RUN npm init -y
# package.json contains Node-RED NPM module and node dependencies
RUN npm i --save node-red
RUN npm i --save node-red-node-msgpack
RUN npm i --save node-red-node-base64
RUN npm i --save node-red-node-suncalc
RUN npm i --save node-red-node-random

RUN npm i --save node-red-dashboard
RUN npm i --save node-red-contrib-firebase
RUN npm i --save node-red-node-email 
RUN npm i --save node-red-node-twitter 
RUN npm i --save node-red-contrib-web-worldmap 
RUN npm i --save node-red-contrib-influxdb
RUN npm i --save node-red-contrib-openfaas




# User configuration directory volume
EXPOSE 1880

# CMD ["npm", "start", "--", "--userDir", "/data"]
EEOOFF


docker build -t nodered /home/pk/0-dockerfiles

}













alias .docker.container.run.nodered="
docker run -d \
--restart always \
--network host  \
--name nodered \
-v `pwd`:/shared  \
-p 1880:1880 \
nodered \
node node_modules/node-red/red.js --userDir /data 




"































alias .adduser="echo pk | sudo -S adduser $USER dialout"




function .vscode.install(){
echo pk | sudo -S snap install vscode --classic
}



function .vscode.visualstudiocode.settings(){


cat << EEOOFF > .config/Code/User/settings.json

{
    "terminal.integrated.shell.linux": "/bin/bash",
    "editor.fontSize": 10,
    "terminal.integrated.fontSize": 10,
    "files.associations": {
        "*.mf": "makefile"
    },
    "editor.renderWhitespace": "all",
}
EEOOFF







# para que pueda controlar cambios en mas archivos, !!!!! necesario en react
cat /proc/sys/fs/inotify/max_user_watches
echo pk | sudo -S echo 'fs.inotify.max_user_watches=524288' >> /etc/sysctl.conf
sudo sysctl -p
cat /proc/sys/fs/inotify/max_user_watches






# plugins  Ctrl+P
ext install dsznajder.es7-react-js-snippets
ext install blanu.vscode-styled-jsx

####
echo instalar plugin jsx-beautify  Ctrl+M

# ===============================
clear
}







alias .docker.container.run.prometheus="
docker run -d \
--restart always \
--name prus \
-p 9090:9090 \
-v /home/pk/0/0_prometheus:/prometheus-data  \
prus ./prometheus --config.file=/prometheus-data/prometheus.yml
"






alias .docker.container.run.tasmoadmin="
docker run -d \
--restart always \
--name tasmoadmin \
-p 8080:80 \
-v /home/pk/0/0_tasmoadmin:/data \
raymondmm/tasmoadmin
"



alias .docker.container.run.hass="   # home assistant
	docker run -d \
	--restart always \
	--name hass \
	-p 80:8123 \
	-v /home/pk/0/0_hass:/config \
	homeassistant/home-assistant
"





# gitea
alias .docker.container.run.gitea="  # gitea
# mkdir /home/pk/0_gitea
docker run -d \
--restart always \
-p 3080:3000 \
-p 30022:22 \
--name gitea \
-v /home/pk/0/0_gitea:/data \
gitea/gitea
"
	# aa aassddffgg















function .orangepi.one.plus(){
ls
}



function .orangepi(){
ls
}


alias .orangepi.screen.install="
echo pk | sudo -S apt install -y screen
echo pk | sudo -S chmod 777 /dev/ttyUSB0
"


alias .orangepi.screen.="
screen /dev/ttyUSB0 115200

"


alias .docker.container.run.a1="
.docker.container.run.gitea
.docker.container.run.jupyter
.docker.container.run.prometheus
.docker.container.run.hass
.docker.container.run.tasmoadmin

"






.orangepi.flash(){
  

# bajar el so y extraerlo
cd Downloads
7z x Armbian_5.59.180824_Orangepioneplus_Ubuntu_bionic_dev_4.18.0-rc7.7z
mv Armbian_5.59.180824_Orangepioneplus_Ubuntu_bionic_dev_4.18.0-rc7.img arm.img


# GUI
# para el xfce
cd ~/Downloads/OrangePi_OnePlus_Ubuntu_16.04_Xfce_Beta
mv O*.img opi.img
# enchufar la sd y comprobarlo con
# echo pk | sudo -S fdisk -l | grep sd
# con gparted desparticionar
# grabarla
echo pk | sudo -S dd bs=4M if=opi.img of=/dev/sdb


# 	# ponerla en la orangepi en unos segundos se debe enender el led verde
# 	# conetar con ttyusb (aarttyusb) o eth 
echo pk | sudo -S chmod 777 /dev/ttyUSB0
screen /dev/ttyUSB0 115200
# la primera vez hace el resize de la memoria y tarda 5 min  para 32g opi1+

# 	# root/1234 cambiada a root/rrttyyuu y creado pk/pk
# 	#  sudo reboot y entro con pk/pk
# 	# y activar la wifi
# 	# echo pk | sudo -S nmcli d wifi connect 'vodafone 958' password '<supersecreto>'
# 	# nmcli d wifi connect 'vodafone 958' password '<supersecreto>'
# 	# ifconfig para ver la ip
# 	# renombrar el pc con sudo nano /etc/hostname





}
























alias .backup.a1="
clear;echo clave ....... pk;

# duplicity /home/me scp://uname@other.host//usr/backup
# duplicity /home/pk/0 scp://pk:pk@${a1}//media/pk/HOME2/0
duplicity /home/pk/0 file:///media/pk/HOME2/0


# para restaurara a otro servidor
# duplicity scp://pk:pk@${a1}//media/pk/HOME2/0 /home/pk/0 
"



alias .backup.restore.a1.="
clear;echo ......restaura del usb del a1 ........... ;read;

duplicity file:///media/pk/HOME2/0 /home/pk/0 
# duplicity scp://pk:pk@${a1}//media/pk/HOME2/0 /home/pk/0
"



alias .backup.restore.a1.a="
clear;echo ......restaura del usb del a1 a otro a ........... ;read;

# duplicity file:///media/pk/HOME2/0 /home/pk/0 
duplicity scp://pk:pk@${a1}//media/pk/HOME2/0 /home/pk/0
"







alias .backup.b1="
clear;echo  de los pis al usb/0pi del a1 ................ ;read;

# duplicity /home/me scp://uname@other.host//usr/backup
# duplicity /home/pk/0 scp://pk:pk@${a1}//media/pk/HOME2/0
duplicity /home/pk/0pi scp://pk:pk@${a1}//media/pk/HOME2/0pi


# para restaurara a otro servidor
# duplicity scp://pk:pk@${a1}//media/pk/HOME2/0 /home/pk/0 
"



alias .backup.restore.b1="
clear;echo ......restaura del usb del a1 ........... ;read;

duplicity file:///media/pk/HOME2/0 /home/pk/0 
# duplicity scp://pk:pk@${a1}//media/pk/HOME2/0 /home/pk/0
"













alias .b.resolucion.hp="
# gtf 1920 1080 60
xrandr --newmode  \"1920x1080_60.00\"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync
xrandr --addmode VGA-0 \"1920x1080_60.00\"  ;
xrandr --output VGA-0 --mode \"1920x1080_60.00\"
"

alias .b.resolucion.acer="
# gtf 1920 1080 60
xrandr --newmode \"1368x768_60.00\"  85.86  1368 1440 1584 1800  768 769 772 795  -HSync +Vsync;
xrandr --addmode VGA-0 \"1368x768_60.00\" ;
xrandr --output VGA-0 --mode \"1368x768_60.00\";
"
alias rr=".b.resolucion.hp"
alias ra=".b.resolucion.acer"






function .ip.publica(){
# namecheap API Key 0d90ee3513464d06bbafb87b7f7f4fcb

echo "$(date)  $(wget -qO - icanhazip.com)" >> 0registro.ips
cat 0registro.ips

}


function .git(){

cd /home/pk/0_jupyter/esp8266.upy.webrpl 

# git init
# git remote add origin http://localhost:8088/pk/0.esp8266.upy.jupyter.webrepl.git
git add .;git commit -m 'pk';git push
}


alias gg="cd /home/pk/0bash.aliases/; add .;git commit -m 'pk';git push"
alias gb="git branch"





function grabar.para.flasear.y.activar.webrpl.en.esp8266(){
# para flasear y activar webrpl en esp8266
ss
.tty.usb.ls
.esptool.erase 
.esptool.flash
.mpfshell.repl
.mpfshell.webrepl.cfg # copiar las funciones una a una
.mpfshell
ctrl-D
xx
}



alias .mpfshell.install="pip install mpfshell"
alias .mpfshell.="
echo pk | sudo -S chmod 666 /dev/ttyUSB0;
mpfshell -c 'open ttyUSB0;repl';"


alias ee=".mpfshell."

# webrepl





alias .esptool.boot="
echo pk | sudo -S chmod 666 /dev/ttyUSB0;
mpfshell -c 'open ttyUSB0;put boot.py;put webrepl_cfg.py;put main.py'
"







alias .mpfshell.webrepl="firefox /home/pk/webrepl/webrepl.html"


alias .mpfshell.put="mpfshell -c 'open ttyUSB0;put main.py"
alias .mpfshell.get="mpfshell -c 'open ttyUSB0;get boot.py;get webrepl_cfg.py;get main.py'"














function .upy.mqtt(){

ls -lha /dev/ttyUSB*
sudo chmod 666 /dev/ttyUSB0;
ls -lha /dev/ttyUSB*



}

















# /dev/ttyACM0


function .Instalacioninicial(){


# ln -s ~/0bash.aliases/.bash_aliases ~/.bash_aliases



sudo apt update
#git
sudo apt install git



.nodejs.install
.docker.install










#################### otros
sudo apt install qbittorrent
sudo apt install speedtest-cli




############### otros
sudo apt install ranger
sudo apt install lynx



sudo apt-get install -y openssh-server
sudo apt-get install -y openvpn
echo pk | sudo -S apt install -y screen
echo pk | sudo -S chmod 777 /dev/ttyUSB0

sudo apt install -y p7zip-full


# en remoto
sudo apt install -y net-tools

curl https://getmic.ro | bash
#sudo snap install micro --classic
sudo apt-get install xclip

sudo apt install mc
sudo apt install -y git
# sudo apt install -y sshpass # se puede sustituir con el pk:pk@....
sudo apt install -y curl
sudo apt install -y terminator
sudo apt install -y mosquitto-clients
sudo apt install -y python3-pip
# pip3 install --user termtosvg
sudo apt-get install arp-scan
###
###






sudo snap install micro --classic


# para hacer backups desde cli, equivalente al gui con deja-dup
sudo apt install duplicity
sudo apt install python-pip

pip install setuptools
sudo apt-get install python-setuptools
sudo apt-get install python-dev

pip install paramiko
##############

sudo apt-get install build-essential
sudo snap install opera




# gparted
sudo apt install gparted

}























function .virtualbox.install(){
# virtualbox

# !!!!!  trabajar siempre en una copia de la imagen
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update
sudo apt-get install -y virtualbox-5.2

# extension pack
wget https://download.virtualbox.org/virtualbox/5.2.22/Oracle_VM_VirtualBox_Extension_Pack-5.2.22.vbox-extpack
# virtualbox Oracle_VM_VirtualBox_Extension_Pack-5.2.22.vbox-extpack 
#  NO  FUNCIONA  INSTALAR LA EXTENSION DE ESTA FORMA SE DEBE hacer doble click al fichero descargado
nautilus .

}





function .virtualbox.w7(){

  virtualbox '/home/pk/0-vm/w7/w7.vbox'
}






function .plaformio.install(){

firefox http://docs.platformio.org/en/latest/installation.html#super-quick-mac-linux &

# python -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"
echo "export PATH=$PATH:~/.platformio/penv/bin" >> .profile
platformio --help
}







function .arduino.ide(){
  sudo chmod 666 /dev/ttyUSB0
  firefox https://github.com/esp8266/Arduino#installing-with-boards-manager &
  /home/pk/Documents/arduino-1.8.5/arduino

}













alias .esptool.install="pip install esptool"
# alias .esptool.install="sudo apt install esptool"

alias .esptool.erase="
echo pk | sudo -S chmod 666 /dev/ttyUSB0;
esptool.py --port /dev/ttyUSB0 erase_flash"
alias .esptool.wget="wget http://micropython.org/resources/firmware/esp8266-20180511-v1.9.4.bin"
alias .esptool.flash="esptool.py --port /dev/ttyUSB0 --baud 460800 write_flash --flash_size=detect 0 ./esp8266-*.bin"


function .esptool.(){ 
.ttyUSB0.ls
.esptool.erase 
# .esptool.wget 
.esptool.flash 
}


alias .m="micro"
alias .mm="micro _aliases"

alias .wifi.clear="ls /etc/NetworkManager/system-connections; echo borrar el que sea"
alias .wifi.="nmcli device wifi rescan; nmcli device wifi list"
alias .wifi.arp-scan.voda="watch -n 0.1 sudo arp-scan 192.168.1.0/24"
alias .wifi.arp-scan.lowi="watch -n 0.1 sudo arp-scan 192.168.0.0/24"
alias .wifi.connect.vodafone="echo pk | sudo -S nmcli d wifi connect 'vodafone 958' password '<supersecreto>';"
alias .wifi.connect.lowi="nmcli d wifi connect 'LowiF800' password '<supersecreto>';"






function .mosquitto.pub(){
      local port="${1:-escribir al final el parametro que se quiera}"
  mosquitto_pub -h 169.254.5.49 -t 'pp' -m "$port"
}
function .mosquitto.sub(){
  mosquitto_sub -h 169.254.5.49 -t 'pp'
}












# ucl:## 	micro conectado
# 	ls -l /dev/ttyUSB*
# 		# ls  /dev/tty*
# ##
# ucesptool: # descargar esptool
# 	sudo apt install python-pip
# 	pip install esptool

# ucbin:# descarar firmware
# 	wget http://micropython.org/resources/firmware/esp8266-20180511-v1.9.4.bin
# uce:##	flash borrar
# 	echo pk | sudo -S adduser $$USER dialout;esptool.py --port /dev/ttyUSB0 erase_flash
# ucw:## 	flashear
# 	esptool.py --port /dev/ttyUSB0 --baud 460800 write_flash --flash_size=detect 0 ./esp8266-*.bin 
# 	# esptool.py --port /dev/ttyUSB0 --baud 460800 write_flash --flash_size=detect 0 ./adafruit-*.bin 




# uww:git clone https://github.com/micropython/webrepl.git
# uewp:echo pk | sudo -S adduser $USER dialout;esptool.py --pfla

# ##node














# --------------------------------------------------------------


function .docker.build.mqtt.arm(){

if ! ls /home/pk/ | grep 00; then
mkdir /home/pk/00;
fi;

cat << EEOOFF > /home/pk/00/dockerfile
FROM arm64v8/ubuntu
RUN apt-get update
RUN apt-get install -y mosquitto mosquitto-clients
EXPOSE 1883

CMD ["mosquitto"]

EEOOFF
docker build -t mqtt /home/pk/00
}
 
# docker network qcreate 0net

alias .docker.container.run.mqtt.arm="

# mosquitto_pub -h 169.254.5.49 -t 'pp' -m 'jojojo' ;
# mosquitto_sub -h 169.254.5.49 -t 'pp' ;

if ! docker image ls | grep mqtt; then \
	.docker.build.mqtt; \
fi; 

docker run -d \
--restart always \
--network 0net \
--name mqtt \
-p 1883:1883 -p 9001:9001 \
mqtt

"




function .docker.build.mqtt.amd(){

if ! ls /home/pk/ | grep 00; then
mkdir /home/pk/00;
fi;

cat << EEOOFF > /home/pk/00/dockerfile
FROM ubuntu
RUN apt-get update
RUN apt-get install -y mosquitto mosquitto-clients
EXPOSE 1883

CMD ["mosquitto"]

EEOOFF
docker build -t mqtt /home/pk/00
}
 
# docker network create 0net

alias .docker.container.run.mqtt.amd="

# mosquitto_pub -h 169.254.5.49 -t 'pp' -m 'jojojo' ;
# mosquitto_sub -h 169.254.5.49 -t 'pp' ;

if ! docker image ls | grep mqtt; then \
	.docker.build.mqtt; \
fi; 

docker run -d \
--restart always \
--network host \
--name mqtt \
-p 1883:1883 -p 9001:9001 \
mqtt

"


# ==========================================================










# --------------------------------------------

# ======================================================





alias .docker.container.run.prometheus.arm="
docker run -d \
--restart always \
--network 0net \
--name prometheus \
-v /home/pk/prometheus:/prometheus \
-p 9090:9090 \
rycus86/prometheus \





"
























































#bash commands








# cat << EEOOFF > /home/$USER/index.html
# <!DOCTYPE html>
# <html>
# <style>
# body {background-color: powderblue;font-size: 200%;}
# </style>
# <body>

# <h1>pk's smarthome enlaces</h1>
# <p><a href='http://localhost:2368'>ghost</a></p>
# <p><a href='http://localhost/bookmarks.html'>bookmarks</a></p>

# <p><a href='http://${op2}:2368'>ghost</a></p>
# <p><a href='http://${op2}:2368/ghost/#/'>ghost editar blog aa aassddffgg</a></p>


# <h2>subiendo el interruptor de la cortina</h2>

# <p><a href='http://${pk2}:8888'>jupyter</a></p>
# <p><a href='http://${pk2}:8088'>gitlab</a></p>

# </body>
# </html>
# EEOOFF




alias .server.python="
echo pk | sudo -S python -m SimpleHTTPServer 8080 
"




alias .server.node="
#echo pk | sudo -S npm install http-server -g
http-server
"





function .sudo.visudoc(){
echo pk | sudo -S echo "pk ALL = NOPASSWD : ALL" /etc/sudoers.tmp
echo pk | sudo -S visudo
clear; source /home/pk/.bashrc
}



alias .code.bash_aliases="code --new-window ~/.bash_aliases "





function .micro.bash_aliases(){
micro ~/.bash_aliases
}



alias .nano.bash_aliases="nano ~/.bash_aliases"
alias .source.bashrc="clear; source /home/pk/.bashrc"
alias .VBoxManage.startvm.w7="VBoxManage startvm w7"
alias .terminalizer.record="terminalizer record /home/pk/tlzr/0pk"
alias .terminalizer.play="terminalizer play /home/pk/tlzr/0pk -s .2"



#alias .aa=".term.inalizer.record"
#alias .zz=".term.inalizer.play"

#alias .ss="termtosvg"
#alias .xx="exit"




alias .nmap="watch -n 1  nmap -sP 192.168.1.*;" 







alias .usb.acm.ls="
ls -lha /dev/ttyACM*
sudo chmod 666 /dev/ttyACM0
ls -lha /dev/ttyACM*
";
alias .usb.ls="
ls -lha /dev/ttyUSB*
echo pk | sudo -S chmod 666 /dev/ttyUSB0
ls -lha /dev/ttyUSB*
";
alias .usb.rm="
echo pk | sudo -S rm -rf /dev/ttyUSB0";

alias .wifi="nmcli device wifi list"
# alias .wifi.connect.MicroPython="nmcli d wifi connect 'MicroPython-9d6d40' password 'micropythoN';"
alias .wifi.connect.MicroPython="nmcli d wifi connect 'MicroPython-9d6f71' password 'micropythoN';"

alias .nmcli.firefox="
firefox https://docs.ubuntu.com/core/en/stacks/network/network-manager/docs/configure-wifi-connections
"
alias .ip="hostname -I | awk '{print \$1}'"










# docker 

alias .ds.rr="docker service ls -q | xargs docker service rm;" ##
alias .docker.container.rm="docker container ls -qa | xargs docker container rm -f;"##
alias .dv.rr="docker volume ls -q | grep -v pk_ | xargs docker volume rm" ##
alias .dv.rr.pk="docker volume ls -q | grep  pk_ | xargs docker volume rm" ##
alias .di.rr="docker rmi -f \$(docker images --filter "dangling=true" -q);" # Remove all <none> images
alias .dn.rr="docker network prune" ##

alias .dc="watch docker container ls" ##
alias .ds="watch docker service   ls" ##
alias .dv="watch docker volume    ls;" ##
alias .dn="watch docker network   ls;" ##
alias .di="docker images"



alias .a1="sshpass -p pk ssh -X pk@a1.local;" 
alias .a2="sshpass -p pk ssh -X pk@a2.local;" 
alias .a3="sshpass -p pk ssh -X pk@a3.local;" 
alias .b1="sshpass -p pk ssh    pk@b1.local;" 
alias .b2="sshpass -p pk ssh    pk@b2.local;"
alias .b3="sshpass -p pk ssh    pk@b3.local;"
alias .c1="sshpass -p pk ssh    pk@c1.local;"
alias .o1="sshpass -p pk ssh    pk@orangepioneplus.local;"



alias .scp.a1="sshpass -p pk scp /home/pk/.bash_aliases pk@a1.local:/home/pk"; 
alias .scp.a2="sshpass -p pk scp /home/pk/.bash_aliases pk@a2.local:/home/pk"; 
alias .scp.a3="sshpass -p pk scp /home/pk/.bash_aliases pk@a3.local:/home/pk"; 
alias .scp.b1="sshpass -p pk scp /home/pk/.bash_aliases pk@b1.local:/home/pk"; 
alias .scp.b2="sshpass -p pk scp /home/pk/.bash_aliases pk@b2.local:/home/pk"; 
alias .scp.b3="sshpass -p pk scp /home/pk/.bash_aliases pk@b3.local:/home/pk"; 
alias .scp.c1="sshpass -p pk scp /home/pk/.bash_aliases pk@c1.local:/home/pk"; 


alias .scp.a=".scp.a1;.scp.a2;.scp.a3;"
alias .scp.b=".scp.b1;.scp.b2;.scp.b3"

alias .scp.=" scp.a ;scp.b;"

# alias scpph=" sshpass -p pk scp /home/$USER/bookmarks.html pk@${op2}:/home/$USER/0html/index.html"
# iiiiiiiiiiiiiiiiiiiiiiiiippppppppppppppppppppppppp




















































# R9QX24DCXDP2YP
# 7QVYJ3WEKSKHHR
# WIFILOWI.es
# lowi











etchosts(){
echo pk | sudo -S chmod 777 /etc/hosts
cat << EEOOFF > /etc/hosts
127.0.0.1  localhost
# 127.0.1.1  pk3

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

${pk1}  a.pk1 b.pk1 c.pk1 d.pk1 e.pk1 f.pk1 g.pk1 h.pk1 i.pk1 j.pk1 k.pk1 l.pk1 m.pk1 n.pk1 o.pk1 p.pk1 q.pk1 r.pk1 s.pk1 t.pk1 u.pk1 v.pk1 w.pk1 pk1 
${pk2}  a.pk2 b.pk2 c.pk2 d.pk2 e.pk2 f.pk2 g.pk2 h.pk2 i.pk2 j.pk2 k.pk2 l.pk2 m.pk2 n.pk2 o.pk2 p.pk2 q.pk2 r.pk2 s.pk2 t.pk2 u.pk2 v.pk2 w.pk2 pk2 
${pk3}  a.pk3 b.pk3 c.pk3 d.pk3 e.pk3 f.pk3 g.pk3 h.pk3 i.pk3 j.pk3 k.pk3 l.pk3 m.pk3 n.pk3 o.pk3 p.pk3 q.pk3 r.pk3 s.pk3 t.pk3 u.pk3 v.pk3 w.pk3 pk3 
${op1}  a.op1 b.op1 c.op1 d.op1 e.op1 f.op1 g.op1 h.op1 i.op1 j.op1 k.op1 l.op1 m.op1 n.op1 o.op1 p.op1 q.op1 r.op1 s.op1 t.op1 u.op1 v.op1 w.op1 op1 
${op2}  a.op2 b.op2 c.op2 d.op2 e.op2 f.op2 g.op2 h.op2 i.op2 j.op2 k.op2 l.op2 m.op2 n.op2 o.op2 p.op2 q.op2 r.op2 s.op2 t.op2 u.op2 v.op2 w.op2 op2 
${op3}  a.op3 b.op3 c.op3 d.op3 e.op3 f.op3 g.op3 h.op3 i.op3 j.op3 k.op3 l.op3 m.op3 n.op3 o.op3 p.op3 q.op3 r.op3 s.op3 t.op3 u.op3 v.op3 w.op3 op3 
# ff
EEOOFF
}
alias c.hosts="etchosts; cat /etc/hosts"
# alias











# alias .docker.container.run.ghost.arm=" # ghost
# docker run -d \
# --restart always \
# --name gghost \
# -p 80:2368 \
# -v /home/pk/0_ghost:/var/lib/ghost/content \
# arm64v8/ghost
# # pk pk@pk.pkpk

  
# "






# # gitlab
# alias .docker.container.run.gitlab="  # gitlab
# # mkdir 0_gitlab
# # mkdir 0_gitlab/config
# # mkdir 0_gitlab/logs
# # mkdir 0_gitlab/data

# # docker run -it 

# docker run -d \
# --restart always \
# -p 443:443 \
# -p 80:80 \
# -p 30022:22 \
# --name gitlab \
# -v /home/pk/0_gitlab/config:/etc/gitlab \
# -v /home/pk/0_gitlab/logs:/var/log/gitlab \
# -v /home/pk/0_gitlab/data:/var/opt/gitlab \
# gitlab/gitlab-ce


# "




	# aa aassddffgg

















# alias dcr.ghost=" \
# if ! docker volume ls | grep pk_ghost; then \
# 	docker volume create --name pk_ghost; \
# fi; \
# docker run -d \
# --name gghost \
# -p 2368:2368 \
# arm64v8/ghost"
# # aa aassddffgg
  








function  .docker.container.run.jupyter(){
  cd
if [ ! -d 0_docker_jupyter ]; then
mkdir 0_docker_jupyter
fi
  	docker run -d \
	--restart always \
	--name jupyter \
	-p 8888:8888 \
	-v /home/pk/0_docker_jupyter:/home/jovyan \
  -e GRANT_SUDO=yes \
  --user root \
	jupyter/scipy-notebook \
	start-notebook.sh \
	--NotebookApp.token=''

chromium http://localhost:8888
}







function kk (){
docker run -it \
	--restart always \
	--name jupyter \
	-p 8888:8888 \
	-v /home/pk/0_jupyter:/home/pk \
  -e GRANT_SUDO=yes \
	jupyter/scipy-notebook



}


# alias .docker.container.run.jupyter="   # jupyter notebook
# 	docker run -d \
# 	--restart always \
# 	--name jupyter \
# 	-p 8888:8888 \
# 	-v /home/pk/0_jupyter:/home/jovyan \
#   --user root \
#   -e NB_GID=100 \
#   -e GEN_CERT=yes \
#   -e GRANT_SUDO=yes \
# 	jupyter/scipy-notebook \
# 	start-notebook.sh \
# 	--NotebookApp.token=''"

# 	# @echo	firefox http://192.168.0.17:8888/
#   # -v /dev/ttyUSB0:/dev/ttyUSB0 \
# # 




alias drdraw=" docker run -it --rm --name=draw -p 8080:8080 -p 8443:8443 fjudith/draw.io"


alias .ds.portainer="
docker service create \
  --name portainer \
  --publish 9000:9000 \
  --constraint 'node.role == manager' \
  --mount type=bind,src=/home/pk/0/0_portainer/data,dst=/data \
  --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  portainer/portainer \
  --no-auth \
  -H unix:///var/run/docker.sock
"

















alias .docker.container.run.nginx="
cp /home/$USER/index.html /home/$USER/0html/index.html
docker run -d -p 80:80 --restart always --name nginx -v /home/$USER/0html/:/usr/share/nginx/html:ro  arm64v8/nginx
# docker run -d -p 80:80 --restart always --name nginx  arm64v8/nginx


"






























# VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR
VISUAL=nano; export VISUAL EDITOR=nano; export EDITOR
# VISUAL=micro; export VISUAL EDITOR=micro; export EDITOR


echo  . TAB  alias





