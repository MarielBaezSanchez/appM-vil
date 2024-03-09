import 'package:flutter/material.dart';
import 'package:historial_exit/screens/frecuencia.dart';
import 'package:historial_exit/screens/historial.dart';
import 'package:historial_exit/screens/saturacion.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitor Cardíaco y de Saturación'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'CodeCrafters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Saturación de Oxígeno'),
              onTap: () {
                Navigator.pop(context); // Cerrar el Drawer
                final ruta1 = MaterialPageRoute(builder: (context) {
                  return const SaturacionOxigeno();
                });
                Navigator.push(context, ruta1);
              },
            ),
            ListTile(
              title: const Text('Frecuencia Cardíaca'),
              onTap: () {
                Navigator.pop(context); // Cerrar el Drawer
                final ruta2 = MaterialPageRoute(builder: (context) {
                  return const FrecuenciaCardiaca();
                });
                Navigator.push(context, ruta2);
              },
            ),
            ListTile(
              title: const Text('Historial'),
              onTap: () {
                Navigator.pop(context); // Cerrar el Drawer
                final ruta3 = MaterialPageRoute(builder: (context) {
                  return const Historial();
                });
                Navigator.push(context, ruta3);
              },
            ),
            ListTile(
              title: const Text('Salir'),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);//modificar esta linea para que nos mande al login al dar clic
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text(
              'Saturación de Oxígeno',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            subtitle: const Text(
              'Información sobre la saturación de oxígeno',
              style: TextStyle(color: Color.fromARGB(181, 0, 0, 0)),
            ),
            leading: const Icon(
              Icons.inbox_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            trailing: const Icon(
              Icons.arrow_right_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onTap: () {
              final ruta1 = MaterialPageRoute(builder: (context) {
                return const SaturacionOxigeno();
              });
              Navigator.push(context, ruta1);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Frecuencia Cardíaca',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            subtitle: const Text(
              'Información sobre la frecuencia cardíaca',
              style: TextStyle(color: Color.fromARGB(181, 0, 0, 0)),
            ),
            leading: const Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            trailing: const Icon(
              Icons.arrow_right_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onTap: () {
              final ruta2 = MaterialPageRoute(builder: (context) {
                return const FrecuenciaCardiaca();
              });
              Navigator.push(context, ruta2);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Historial',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            subtitle: const Text(
              'Historial de mediciones',
              style: TextStyle(color: Color.fromARGB(181, 0, 0, 0)),
            ),
            leading: const Icon(
              Icons.history,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            trailing: const Icon(
              Icons.arrow_right_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onTap: () {
              final ruta3 = MaterialPageRoute(builder: (context) {
                return const Historial();
              });
              Navigator.push(context, ruta3);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
