import 'package:alarma_mobile/main.dart';
import 'package:flutter/material.dart';

class CrearProyecto extends StatefulWidget{
  const CrearProyecto({super.key});
  @override
  State<CrearProyecto> createState() => _CrearProyectoState();
}


class _CrearProyectoState extends State<CrearProyecto> {
  String monthToString(int month) {
    switch (month) {
      case 1:
        return 'Ene';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Abr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Ago';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dic';
      default:
        return '';
    }
  }



  List<String> nombresTareas = [];
  final nombreController = TextEditingController();
  final fechaController = TextEditingController();

  var selectedDate = "Fecha de entrega";

  void callDatePicker() async {
    final DateTime? order = await getDate();
    if (order != null) {
      setState(() {
        selectedDate = "${monthToString(order.month)} ${order.day}, ${order.year}";
      });
    }
  }

  Future<DateTime?> getDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.grey,
              onPrimary: Colors.white,
              onSurface: Colors.white,
            ),
            dialogTheme: DialogTheme(
              backgroundColor: Colors.grey[800],
            ),
          ),
          child: child!,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 62, 63),
        shadowColor: const Color.fromARGB(255, 67, 62, 63).withOpacity(0.8),
        title: const Text(
          "Crear Proyecto",
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
              width: 375,
              height: 145,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color.fromARGB(255, 204, 204, 204), width: 0.33),
                          bottom: BorderSide(color: Color.fromARGB(255, 204, 204, 204), width: 0.33),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              '  Nombre:',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Inter'),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: nombreController,
                              style: const TextStyle(color: Color.fromARGB(255, 204, 204, 204)),
                              decoration: const InputDecoration(
                                hintText: 'Nombre del Proyecto',
                                hintStyle: TextStyle(color: Color.fromARGB(255, 153, 153, 153), fontSize: 16),
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.center, 
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color.fromARGB(255, 204, 204, 204), width: 0.33),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              '  Fecha:',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600,fontFamily: 'Inter'),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                                    onPressed: callDatePicker,
                                    child: Text(
                                      selectedDate,
                                      style: const TextStyle(color: Color.fromARGB(255, 153, 153, 153), fontSize: 16),
                                    ),
                                  )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tareas Asociadas", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700, fontFamily: 'Inter')),
                      const SizedBox(width: 100),
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 217, 217, 217),
                          size: 45,
                        ),
                        onPressed: () {
                          setState(() {
                            nombresTareas.add('Nueva Tarea'); // Agrega una nueva tarea
                          });
                        },
                      ),
                    ],
                  ),
                ),
          ),
          Positioned(
            child:Container(
                margin: const EdgeInsets.only(top: 240),
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration:  const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color.fromARGB(255, 204, 204, 204), width: 0.33),
                      ),
                  ),
                child: const Padding(
                  padding:  EdgeInsets.only(left: 10) ,
                  child: Row(
                    children: [
                      Expanded(flex: 5, child: Text('Nombre', textAlign: TextAlign.left, style: TextStyle(color: Color.fromARGB(255, 204, 204, 204),fontSize: 10,fontWeight: FontWeight.bold))),
                      Expanded(flex: 5, child: Text('Acciones', textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 204, 204, 204),fontSize: 10,fontWeight: FontWeight.bold)))
                    ]
                ))
              )
          ),
          Positioned(
            child: Container(
              height: 250,
              margin: const EdgeInsets.only(top: 265),
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: nombresTareas.length,
                  itemBuilder: (context, index) {
                    return Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color.fromARGB(255, 204, 204, 204), width: 0.33),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Text(nombresTareas[index],textAlign: TextAlign.left,style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,),
                            ),
                          ),
                          const Expanded(
                            flex: 5,
                            child: TextButton(
                              onPressed:null,
                              child: Text("Editar",textAlign: TextAlign.center,style: TextStyle(color: Color.fromARGB(255, 252, 134, 83),fontSize: 16))
                            )
                          ),
                          const Expanded(
                            flex: 5,
                            child: TextButton(
                              onPressed:null,
                              child: Text("Repetir",textAlign: TextAlign.center,style: TextStyle(color: Color.fromARGB(255, 252, 134, 83),fontSize: 16))
                            )
                          )
                        ],
                      ),
                    ),
                  );
                  },
                ),
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
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 153, 153, 153),
                        minimumSize: const Size(147, 58),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Cancelar', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Inter'),textAlign: TextAlign.center),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {

                        Proyecto nuevoProyecto = Proyecto(
                          nombre: nombreController.text,
                          fecha: selectedDate,
                          cantidadDeTareas: nombresTareas.length,
                        );
                        // Navega hacia atrás y pasa el nuevo proyecto
                        Navigator.pop(context, nuevoProyecto);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 252, 134, 83),
                        minimumSize: const Size(147, 58),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Crear\nProyecto', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Inter', height: 1),textAlign: TextAlign.center),
                    )
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}


