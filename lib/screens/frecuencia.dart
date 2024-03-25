import 'package:flutter/material.dart';
import 'package:historial_exit/screens/historial.dart';
import 'package:historial_exit/screens/saturacion.dart';
import 'package:historial_exit/theme/app_theme.dart';

class FrecuenciaCardiaca extends StatefulWidget {
  const FrecuenciaCardiaca({super.key});

  @override
  State<FrecuenciaCardiaca> createState() => _FrecuenciaCardiacaState();
}

class _FrecuenciaCardiacaState extends State<FrecuenciaCardiaca> {
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
            MaterialPageRoute(builder: (context) => const Historial()),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frecuencia Cardíaca'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.azulito),
          ),
        ),
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
            icon: Icon(Icons.history, color: AppTheme.azulito,),
            label: 'Historial',
          ),
        ],
      ),
    );
  }
}
