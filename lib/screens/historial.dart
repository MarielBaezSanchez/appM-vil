import 'package:flutter/material.dart';
import 'package:historial_exit/screens/frecuencia.dart';
import 'package:historial_exit/screens/saturacion.dart';
import 'package:historial_exit/theme/app_theme.dart';

class Historial extends StatefulWidget {
  const Historial({super.key});

  @override
  State<Historial> createState() => _HistorialState();
}

class _HistorialState extends State<Historial> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pop(context);
    } else {
      switch (index) {
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SaturacionOxigeno()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const FrecuenciaCardiaca()),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        backgroundColor: AppTheme.backColor,
      ),
      body: ListView(
        children: [
          _historialItem(
            fecha: '2024-03-08',
            frecuenciaCardiaca: 70,
            saturacionOxigeno: 95,
          ),
          _historialItem(
            fecha: '2024-03-07',
            frecuenciaCardiaca: 72,
            saturacionOxigeno: 96,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppTheme.azulito,),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: AppTheme.azulito,),
            label: 'Saturación de Oxígeno',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: AppTheme.azulito,),
            label: 'Frecuencia Cardiaca',
          ),
        ],
      ),
    );
  }

  Widget _historialItem({
    required String fecha,
    required int frecuenciaCardiaca,
    required int saturacionOxigeno,
  }) {
    return GestureDetector(
      onTap: () {
        print('Tocado el elemento del historial');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: AppTheme.widgetsColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fecha de captura: $fecha',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Frecuencia cardíaca: $frecuenciaCardiaca'),
            Text('Saturación de oxígeno: $saturacionOxigeno'),
          ],
        ),
      ),
    );
  }
}