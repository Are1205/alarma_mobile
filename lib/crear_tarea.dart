import 'package:alarma_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CrearTarea extends StatefulWidget {
  const CrearTarea({super.key});

  @override
  _CrearTareaState createState() => _CrearTareaState();
}

class _CrearTareaState extends State<CrearTarea> {
    // Declare the text editing controllers
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _ubicacionController = TextEditingController();
  List<String> tareas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 62, 63),
        shadowColor: const Color.fromARGB(255, 67, 62, 63).withOpacity(0.8),
        title: const Text(
          "Agregar Tareas",
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(color: const Color.fromARGB(240, 0, 0, 0)),
          Positioned(
            left: 8,
            top: 15,
            child: Container(
              padding: const EdgeInsets.all(11),
              width: 375,
              height: 305,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 67, 62, 63), // Color de fondo
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // Sombra negra al 25%
                    spreadRadius: 1, // Radio de expansión de la sombra
                    blurRadius: 4, // Radio de desenfoque de la sombra
                    offset: const Offset(0, 0), // Desplazamiento de la sombra en dirección X y Y
                  ),
                ],
              ),
              child: Column(
                children :[
                  //Nombre de la tarea
                  Row (
                    children:[
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Color(0xFF999999), width: 0.33),
                              bottom: BorderSide(color: Color(0xFF999999), width: 0.33),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                flex:4,
                                child: Text(
                                  '  Nombre:',
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Inter'),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: TextField(
                                  controller: _nombreController,
                                  style: const TextStyle(color: Color.fromARGB(255, 204, 204, 204)),
                                  decoration: const  InputDecoration(
                                    hintText: 'Nombre de la tarea',
                                    hintStyle: TextStyle(color: Color.fromARGB(255, 153, 153, 153), fontSize: 16),
                                    border: InputBorder.none,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/Alarma.png',
                          height: 70,
                          width: 70,
                        ),
                        onPressed: () {
                        },
                      )
                    ]
                  ),
                  //Botones de fecha y hora
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child:  Row(
                      children:[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 252, 134, 83),
                              minimumSize: const Size(110, 67),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos en la fila
                              children: [
                                Image.asset(
                                  'assets/calendar.png',
                                  height: 24,
                                  width: 24,
                                ), // Imagen
                                const SizedBox(width: 4), // Espacio entre la imagen y el texto
                                const Text('Día', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Inter', height: 1),textAlign: TextAlign.center)
                              ],
                            ),
                          )
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 252, 134, 83),
                              minimumSize: const Size(110, 67),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Hora\n Inicio', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Inter', height: 1),textAlign: TextAlign.center)
                          )
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 252, 134, 83),
                              minimumSize: const Size(110, 67),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Hora\n Fin', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Inter', height: 1),textAlign: TextAlign.center)
                          )
                        )
                      ]
                    )
                  ),
                  //Ubicación
                  Row (
                    children:[
                      IconButton(
                        icon: Image.asset(
                          'assets/Ubicacion.png',
                          height: 70,
                          width: 70,
                        ),
                        onPressed: () {
                        },
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Color(0xFF999999), width: 0.33),
                              bottom: BorderSide(color: Color(0xFF999999), width: 0.33),
                            ),
                          ),
                          child: Row(
                            children: [
                              const  Expanded(
                                flex:4,
                                child: Text(
                                  ' Ubicación:',
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Inter'),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: TextField(
                                  controller: _ubicacionController,
                                  style: const TextStyle(color: Color.fromARGB(255, 204, 204, 204)),
                                  decoration: const InputDecoration(
                                    hintText: 'Ingrese la Ubicación',
                                    hintStyle: TextStyle(color: Color.fromARGB(255, 153, 153, 153), fontSize: 16),
                                    border: InputBorder.none,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ),
                ]
              )
            )
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(top: 550),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    ElevatedButton(
                      onPressed: () {
                          tareas.add(_nombreController.text);
                          _nombreController.clear();
                          _ubicacionController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 153, 153, 153),
                        minimumSize: const Size(147, 68),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Agregar\nOtra', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Inter',height: 1),textAlign: TextAlign.center),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                          if (_nombreController.text.isNotEmpty) {
                            // Agregar a tareas
                            tareas.add(_nombreController.text);
                          }
                        Navigator.pop(context, tareas);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 252, 134, 83),
                        minimumSize: const Size(147, 68),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Aceptar\nTareas', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Inter', height: 1),textAlign: TextAlign.center),
                    )
                ]
              ),
            ),
          )
        ]
      )
    );
  }
}