import 'package:flutter/material.dart';

class _ToolDescription extends StatelessWidget {
  const _ToolDescription({
    required this.id,
    required this.nombre,
    required this.cantidad_D,
    required this.marca,
    required this.fecha_in,
  });

  final String id;
  final String nombre;
  final int cantidad_D;
  final String marca;
  final String fecha_in;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: (Border.all(width: 2.0, color: const Color(0xFF6ABFE1))),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlueAccent.withOpacity(0.3), // Color de la sombra con opacidad
            spreadRadius: 2, // Expansión de la sombra
            blurRadius: 10,  // Desenfoque de la sombra
            offset: Offset(4, 0), // Desplazamiento de la sombra en el eje x y y
          ),
        ],),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ID: $id',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 2.0)),
            Expanded(
              child: Text(
                nombre,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
            ),
            Text(
              'Cant. Disp: $cantidad_D',
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
              ),
            ),
            Text(
              'Marca: $marca - Fecha Ingreso: $fecha_in',
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomToolItem extends StatelessWidget {
  const CustomToolItem({
    super.key,
    required this.thumbnail,
    required this.id,
    required this.nombre,
    required this.cantidad_D,
    required this.marca,
    required this.fecha_in,
  });

  final Widget thumbnail;
  final String id;
  final String nombre;
  final int cantidad_D;
  final String marca;
  final String fecha_in;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ToolDescription(
                  id: id,
                  nombre: nombre,
                  cantidad_D: cantidad_D,
                  marca: marca,
                  fecha_in: fecha_in,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
