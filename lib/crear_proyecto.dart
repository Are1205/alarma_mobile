import 'package:flutter/material.dart';

class CrearProyecto extends StatefulWidget{
  const CrearProyecto({super.key});
  @override
  State<CrearProyecto> createState() => _CrearProyectoState();
}

class _CrearProyectoState extends State<CrearProyecto> {
  DateTime selectedDate = DateTime.now();
  List<String> nombresTareas = ['Tarea 1', 'Tarea 2', 'Tarea 3'];

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
                              style: const TextStyle(color: Color.fromARGB(255, 204, 204, 204)),
                              decoration: InputDecoration(
                                hintText: 'Nombre del Proyecto',
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
                                border: InputBorder.none,
                              ),
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
                            child: TextField(
                              style: const TextStyle(color: Color.fromARGB(255, 204, 204, 204)),
                              decoration: InputDecoration(
                                hintText: 'Fecha de entrega',
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            top: 180,
            child:Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tareas Asociadas", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700, fontFamily: 'Inter')),
                      SizedBox(width: 100),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 217, 217, 217),
                          size: 45,
                        ),
                        onPressed: null,
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
              margin: const EdgeInsets.only(top: 265),
              child: ListView.builder(
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
        ],
      ),
    );
  }
}
