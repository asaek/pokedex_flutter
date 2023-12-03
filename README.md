#pokedex_flutter

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Pokemon](https://img.shields.io/badge/Pokemon-FFCB05?style=for-the-badge&logo=pokemon&logoColor=black)
![Pokedex](https://img.shields.io/badge/Pokedex-FF0000?style=for-the-badge&logo=pokedex&logoColor=white)
![Status](https://img.shields.io/badge/Status-Finished-green)
# Instalacion
1. Clona el repositorio:
[Repo](https://github.com/asaek/pokedex_flutter.git)
2. Navega al directorio del proyecto:
```bash
cd pokedex_flutter
```
3. Instala las dependencias:
```bash
flutter clean && flutter pub get
```
4. Asegurate de tener un dispositivo de ejecucion conectado, ya sea un emulador o un dispositivo fisico.
5. Ejecuta la aplicación:
```bash
flutter run
```
6. `enjoin`

# Uso

1. Veras una lista de Pokemon en la pantalla principal de la aplicacion.
    
2. Puedes desplazarte por la lista para ver mas Pokemon. La aplicacion cargara mas Pokemon a medida que te desplaces hacia abajo.

3. Puedes ordenar la lista alfabeticamente o por id en el boton que se encuentra aun lado del recuadro de la busqueda.
    
4. Si quieres buscar un Pokemon especifico, puedes usar la barra de busqueda en la parte superior de la pantalla.

5. Si haces clic en un Pokemon, se abrira una pantalla de detalles donde podras ver mas informacion sobre ese Pokemon.
6. Si no tienes internet te saldra un `vamo a calmarno`


# Documentación

Este proyecto sigue la estructura de clean arquitecture, riverpod, atomic design, design tokens y Flutter. Aqui hay una descripcion general de los archivos y directorios mas importantes:

- `lib/`: Este directorio contiene todo el codigo Dart para el proyecto.
  - `main.dart`: Este es el punto de entrada de la aplicacion. Aqui es donde se inicia la aplicacion de Flutter.
  - `data/`: Este directorio contiene todo lo referente al consumo del `pokeapi.co` y su respectivo mapeo
  - `domain/`: Este directorio contiene todo lo referente a las reglas del juego jaja, las entidades y los repositorios o algunos los llaman casos de uso.
  - `presentation/`: Este directorio contiene todo lo referente a la interfaz de usuario y los providers.
  - `presentation/pages/pokedex/pokedex_menu.dart`: Este archivo contiene el codigo para la pantalla principal de la aplicacion, que muestra una lista de Pokemon.
  - `presentation/pages/pokedex/pokemon_details.dart`: Este archivo contiene el codigo para la pantalla principal de la aplicacion, que muestra una lista de Pokemon.
- `pubspec.yaml`: Este archivo contiene la configuracion del proyecto y la lista de dependencias de Dart y Flutter.

Para obtener mas informacion sobre como trabajar con Flutter, consulta la [documentación de Flutter](https://flutter.dev/docs).

Para obtener mas informacion sobre como trabajar con Riverpod, consulta la [documentación de Riverpod](https://riverpod.dev/docs/concepts/reading).

# Estado del Proyecto
![Status](https://img.shields.io/badge/Status-Finished-green)
![Finalizado](https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/7.png)


# Contacto

Correo:
`Asaek60@gmail.com`
