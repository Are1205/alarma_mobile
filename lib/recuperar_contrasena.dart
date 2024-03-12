import 'package:flutter/material.dart';

class RecuperarContrasena extends StatefulWidget {
  const RecuperarContrasena({Key? key}) : super(key: key);

  @override
  State<RecuperarContrasena> createState() => _RecuperarContrasenaState();
}

class _RecuperarContrasenaState extends State<RecuperarContrasena> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(color: const Color.fromARGB(240, 0, 0, 0)),
          Positioned(
            left: 17,
            top: 79,
            child: Container(
              width: 356,
              height: 590,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 67, 62, 63), // Color de fondo
                borderRadius: BorderRadius.circular(10.0),
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
                      padding: const EdgeInsets.all(16.0),
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container( // This is the box for the icon
                              width: 100,
                              height: 100, 
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 252, 134, 83), // Set a light background color
                                borderRadius: BorderRadius.circular(10.0), // Add rounded corners
                              ),
                              child:  Icon(Icons.alarm_on, size: 65, color: Colors.white),
                            ),
                            Center(
                              child: Text(
                                'Recuperar tu Contraseña',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                     
                          Text(
                            '¿Extraviaste o olvidaste tu \n contraseña? No te preocupes ...', 
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Inter'),
                          ),
                          
                          SizedBox(height: 24.0),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Correo Electrónico',
                              hintText: 'Ingresa tu email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.grey, // Personaliza el color de la etiqueta
                                fontSize: 14.0, // Ajusta el tamaño de la fuente de la etiqueta
                                fontFamily: 'Inter', // Usa la misma fuente que el texto del campo
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400, // Personaliza el color del texto de sugerencia
                                fontSize: 14.0, // Ajusta el tamaño de la fuente del texto de sugerencia
                                fontFamily: 'Inter', // Usa la misma fuente que el texto del campo
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Inter',
                            ),
                            
                          ),
                          
                          SizedBox(height: 100.0),
                          
                           Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {Navigator.pop(context);
                          },
                          child: Text(
                            'VOLVER',
                             style: TextStyle(
                                  color: Colors.white, // Set the text color
                                  fontSize: 20, // Set the font size
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter', // Set the font weight
                                ),),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(104, 68),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            backgroundColor: Color.fromRGBO(153, 153, 153, 1), // Color del fondo del botón izquierdo
                          ),
                        ),
                          ElevatedButton(
                            
                            onPressed: (){
                                // Implementar la lógica para enviar el correo electrónico de recuperación de contraseña
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Se ha enviado un correo electrónico para recuperar tu contraseña'),
                                  ),
                                );
                              },
                            child: Text('ENVIAR', style: TextStyle(
                                  color: Colors.white, // Set the text color
                                  fontSize: 20, // Set the font size
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter', // Set the font weight
                                ),),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(104, 68), // Set width and height
                               shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              backgroundColor: Color.fromARGB(255, 252, 134, 83), // Set the background color
                            ),
                          ),
                        ],
                      ),
                    ]
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}