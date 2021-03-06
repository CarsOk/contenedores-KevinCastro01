import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/comment_model.dart';

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SENA'),
      ),
      body: FutureBuilder<List<Comment>>(
        future: getDatosComments(),
        builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Comment> comentarios = snapshot.data;

            return construirLista(comentarios);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView construirLista(List<Comment> comentarios) {
    return ListView.builder(
        itemCount: comentarios.length,
        itemBuilder: (BuildContext context, int index) {
          Comment comment = comentarios[index];
          return Column(
            children: [
              ListTile(
                leading: Icon(Icons.account_circle_sharp),
                title: Text('ID:'),
                subtitle: Text(comment.id.toString()),
              ),
              ListTile(
                title: Text(comment.email),
                leading: Icon(Icons.email),
                subtitle: Text(comment.name),
              ),
              ListTile(
                leading: Icon(Icons.content_copy),
                title: Text('Contenido:'),
                subtitle: Text(comment.body),
              ),
              Divider(
                color: Colors.black,
              )
            ],
          );
        });
  }

  Future<List<Comment>> getDatosComments() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    final respuesta = await http.get(url);
    // print(respuesta.body);
    if (respuesta.statusCode == 200) {
      return commentFromJson(respuesta.body);
    } else {
      return null;
    }
  }
}
