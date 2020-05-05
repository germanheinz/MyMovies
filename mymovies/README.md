# mymovies

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


#Anotaciones
#1
1-contro+shift+p para buscar flutter, new proyect
2-nombre del proyecto
3-Lugar para guardarlo
4-En main usar snippets importm + tab, mateapp + tab
5-crear carpeta src - pages.
6-crear archivo home_page.dart, para desde main.dart pasarle las routes

#2
Crear un swiper de tarjetas
En el body de home_page, hago referencia a una nueva funcion
el cual regresara un widget

Documentacion para crear carrousel en stack
https://pub.dev/packages/flutter_swiper#-readme-tab-
sigo los pasos para generarlo

#3 Creo una nueva carpeta con el arvhivo card_swiper_widget
para luego poder usarla sin repetir codigo
Corto todo el codigo del home y pego en card_swiper_widget

#4 Movie Model
Creo el modelo para Movie

#5
Movie Provider, importo http de Dart https://pub.dev/packages/http#-installing-tab- en pubspec.yaml. Es como el services de Angular
Uri, es una herramienta de Dart que facilita la creacion de los path

#6 
Mostrando poster en Swiper.
Desde el CardSwiper llamo un metodo en el Movie model