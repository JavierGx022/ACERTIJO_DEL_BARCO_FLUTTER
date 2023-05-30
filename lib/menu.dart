import 'package:flutter/material.dart';
import 'package:game_uno/rutas.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: SizedBox(
          width: 450,
          child: ListView(
            children: const [
              SizedBox(height: 50),
              Text(
                  '                     Reglas para resolver el acertijo. \n\n 1. El lobo, la oveja y la lechuga deben cruzar un río de un lado a otro.\n'
                  '2. El bote solo puede llevar al granjero y a una cosa (lobo, oveja o lechuga) a la vez.\n'
                  '3. Si el lobo y la oveja se quedan solos en la misma orilla, el lobo se comerá a la oveja.\n'
                  '4. Si la oveja y la lechuga se quedan solas en la misma orilla, la oveja se comerá la lechuga.\n'
                  'SUERTE....'
                  '           \n'
                  '           \n'),
              ButtonItem(
                titulo: 'Iniciar',
                ruta: Rutas.juego1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonItem extends StatelessWidget {
  final String titulo;
  final String ruta;

  const ButtonItem({super.key, required this.titulo, required this.ruta});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(titulo),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(ruta);
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
