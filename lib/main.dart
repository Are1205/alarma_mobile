import 'package:alarma_mobile/crear_proyecto.dart';
import 'package:alarma_mobile/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255,67, 62, 63)),
        useMaterial3: true,
      ),
      home:const MyHomePage(title: 'Proyectos') ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Tarea {
  String nombre;
  Tarea(this.nombre);
}

class Proyecto {
  String nombre;
  String fecha;
  List<Tarea> listaTareas;
  Proyecto(this.nombre, this.fecha, this.listaTareas);
}


class _MyHomePageState extends State<MyHomePage> {
  bool isAuthenticated = false; // Estado de autenticación
  List<Map<String, dynamic>> listaDeProyectos = [
    {'nombre': 'Proyecto 1', 'numeroTareas': 9, 'fechaEntrega': 'Jun 20, 2023'},
    {'nombre': 'Proyecto 2', 'numeroTareas': 2, 'fechaEntrega': 'Jun 20, 2023'},
  ];

  int _selectedIndex = 1; // Inicializa con el primer índice seleccionado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza el índice seleccionado cuando se toca un elemento en la barra de navegación
    });
  }

  void _login() {
    setState(() {
      isAuthenticated = true; // Establece isAuthenticated en true al iniciar sesión
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAuthenticated
        ? _buildAuthenticatedHomePage()
        : LoginPage(onLogin: _login); // Muestra LoginPage si no está autenticado
  }
  Widget _buildAuthenticatedHomePage() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 62, 63),
        shadowColor: const Color.fromARGB(255, 67, 62, 63).withOpacity(0.8),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 217, 217, 217),
              size: 40,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CrearProyecto()));
            },
          ),
        ]
      ),
      body: Container(
        color: const Color.fromARGB(240, 0, 0, 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 204, 204, 204), // Color de la línea separadora
                    width: 0.33, // Grosor de la línea separadora
                  ),
                )
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0), // Ajusta el valor según sea necesario
                        child: Text(
                          'Nombre',
                          style: TextStyle(
                            color: Color.fromARGB(255, 204, 204, 204), // Color de texto
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Nº de Tareas',
                        style: TextStyle(
                          color: Color.fromARGB(255, 204, 204, 204), // Color de texto
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Fecha de entrega',
                        style: TextStyle(
                          color: Color.fromARGB(255, 204, 204, 204), // Color de texto
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                ]
              ),
            ),
            Expanded(child: ListView.builder(
              itemCount: listaDeProyectos.length,
              itemBuilder: (context, index){
                Map<String, dynamic> proyecto = listaDeProyectos[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 204, 204, 204), // Color de la línea separadora
                        width: 0.33, // Grosor de la línea separadora
                      ),
                    )
                  ),
                  child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      title:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Expanded(
                          flex: 7,
                          child: Text(
                            proyecto['nombre'],
                            style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600)
                          )) ,
                          Expanded(
                          flex: 3,
                          child: Text(
                              '${proyecto['numeroTareas']}',
                              style: const TextStyle(color: Color.fromARGB(255, 204, 204, 204),fontSize: 15,fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                          flex: 4,
                          child: Text(
                              '${proyecto['fechaEntrega']}',
                              style: const TextStyle(color: Color.fromARGB(255, 204, 204, 204),fontSize: 15,fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                );
              })
              )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 67, 62, 63), // Color de fondo de la barra de navegación
        selectedItemColor: const Color.fromARGB(255, 252, 134, 83), // Color del icono seleccionado
        unselectedItemColor: const Color.fromARGB(255, 204, 204, 204), // Color del icono no seleccionado
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 40,
        items:  <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tareas',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Proyectos.svg',
              width: 40,
              height: 40,
              color: _selectedIndex == 1 ? const Color.fromARGB(255, 252, 134, 83) : const Color.fromARGB(255, 204, 204, 204), // Color del icono según el estado
              ),
            label: 'Proyectos',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurción de Alarma',
          ),
        ],
      ),
    );
  }
}
