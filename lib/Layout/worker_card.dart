import 'package:flutter/material.dart';

class _WorkerDescription extends StatelessWidget {
  const _WorkerDescription({
    required this.id,
    required this.nombre,
    required this.rol,
    required this.fecha_in,
    required this.estado
  });

  final String id;
  final String nombre;
  final String rol;
  final String fecha_in;
  final bool estado;

  String disponibilidad(bool estado){
    if(estado == false){
      return 'Activo';
    }else if(estado == true){
      return 'De Baja';
    }
    return 'error';
  }

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
              'Rol: $rol',
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
              ),
            ),
            Text(
              'Fecha Ingreso: $fecha_in - Estado: ${disponibilidad(estado)}',
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

class CustomWorkerItem extends StatelessWidget {
  const CustomWorkerItem({
    super.key,
    required this.thumbnail,
    required this.id,
    required this.nombre,
    required this.rol,
    required this.fecha_in,
    required this.estado
  });

  final Widget thumbnail;
  final String id;
  final String nombre;
  final String rol;
  final String fecha_in;
  final bool estado;

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
                child: _WorkerDescription(
                  id: id,
                  nombre: nombre,
                  rol: rol,
                  fecha_in: fecha_in,
                  estado: estado
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
