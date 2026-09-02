Bitácora del error

Cada error que enfrenté al implementar los botones quedó documentado con estos cuatro campos: síntoma, causa identificada, solución aplicada y verificación.

Error 1: heroTag duplicado al agregar el segundo botón

Síntoma:

There are multiple heroes that share the same tag within a subtree.
Exception caught by widgets library

Causa identificada: Flutter le asigna un heroTag automático a cada FloatingActionButton, y por defecto es el mismo para todos los botones de ese tipo en el árbol de widgets. Al agregar el segundo FAB (reset) sin darle un tag propio, quedó compitiendo con el de incrementar por el mismo tag durante la animación.

Solución aplicada: le asigné un heroTag único a cada botón (heroTag: 'increment' y heroTag: 'reset') para diferenciarlos explícitamente.

Verificación: corrí flutter run de nuevo; ambos botones se mostraron sin lanzar la excepción y cada uno respondió solo a su propio onPressed.

Error 2: el contador no se reiniciaba en pantalla

Síntoma: al presionar el botón de reset, el valor interno volvía a 0 (lo comprobé con un print(_counter)), pero el número que se veía en pantalla no cambiaba.

Causa identificada: la primera versión de _resetCounter() hacía _counter = 0; fuera de setState(), así que Flutter nunca se enteraba de que debía reconstruir el widget.

Solución aplicada: moví la asignación dentro de setState(() { _counter = 0; });, igual que ya estaba hecho en _incrementCounter.

Verificación: reinicié la app, incrementé el contador varias veces y confirmé visualmente que el botón de reset lo regresaba a 0 en pantalla, no solo en el valor interno.