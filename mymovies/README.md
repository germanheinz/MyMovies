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

#7 
Comenzando a desarrollar Infinite Scroll horaizontal

#8
PageView es una coleccion por la que recibe un children, que es una lista de widget

#9
Posible problema con los futures. Al crear el widget horizontal, cuando llegue al final, seria conveniente volver a cargar mas peliculas, disparar nuevamente la funcion.
Pero como queremos el componente para scroll horizontal se pueda volver a usar en nuestro codigo y no volver a escribir, lo definimos en un statelesswidget.
el home_page el cual tiene relacion con el statelesswidget, va a hacer referencia a la clase stateless.
Como solo se puede llamar al future una vez, es tiempo de utilizar stream

#10
Stream Controller.
Seria nuestra tuberia, en donde hay data de entrada y de salida. 
stream transformer, tuberia que cambia lo que entra.
sink: agregar informacion al stream
stream: cuando queramos escuchar lo que emite la tuberia deberiamos usar stream

Patron Bloc
Una forma para manejar el estado de la data de mi aplicacion.
Centraliza informacion.
Un bloc trabaja en base a stream.
3 puntos importantes
-Trabaja unicamente entradas y salidas.
-Para introducir info usaremos el sinj y para la salida usaremos stream
-Es importante cerrar el stream cuando ya no lo necesitemos

La idea es que los widget se encargen de dibujar y no de contrar el estado de la informacion.

ej.
class mi bloc{
    StreamController<String> _streamController = new StreamController<String>();
    Sink<String> get inputSink => streamController.sink;
    Stream<String> get outputStream => streamController.stream;
}
para cerrar el stream
class..
void dispose(){
    _streamController?.close();
}

En flutter el widget es StreamBuilder

#11
Optimizamos la app. 
primero: Agrego una bandera de true o false para emitir cargar page, y pregunto con condicional si quiero seguir cargando o no
segundo: cambiamos el pageView por PageView.builder. Esto es para que vaya cargando 
a medida que vaya necesitando

#12
Como saber cuando se clickea en una pelcula?
usando GestureDetector

en movie_horizontal regreso

 return GestureDetector(
    child: card, 
    onTap: (){
        print(movies.title);
        Navigator.pushNamed(context, 'detail', arguments: movies); 
    }
);
le paso el nombre de la pagina a donde quiero ir y en argumento el objeto seleccionado



#13
Diseño de la pagina de detalles
se debe usar CustomScrollView para generar el efecto deseado
y la estructura de un CustomScrollView es 
 body: CustomScrollView(
        slivers: <Widget>[
          _createAppbar(movie),

lo que no quiero que desaparezca se lo define como
 SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0),
                _posterTitle(movie, context),
                _description(movie),
                _description(movie),
                _description(movie),
                _description(movie),
                _description(movie),
              ]
            ),
          )

#14
Hero Animations
Muy simple aplicar el efecto, solo envolver el objeto que se quiera generar el efecto, en un widget del tipo Hero, y pasarle el mismo tag