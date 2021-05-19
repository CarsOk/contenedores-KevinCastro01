import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post_model.dart';
import 'package:http/http.dart' as http;

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SENA'),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder<Post>(
        future: getInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Post post = snapshot.data;
            return respuesta(post);
          }
          return Center(child: CircularProgressIndicator());
        },
      )),
    );
  }

  Column respuesta(Post post) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.account_box),
          title: Text('ID de usuario:'),
          subtitle: Text(post.userId.toString()),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.account_circle_sharp),
          title: Text('ID:'),
          subtitle: Text(post.id.toString()),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.title),
          title: Text('Titulo:'),
          subtitle: Text(post.title),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.content_copy),
          title: Text('Contenido:'),
          subtitle: Text(post.body),
        )
      ],
    );
  }

  Future<Post> getInfo() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/10');
    final respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return new Post.fromJson(respuesta.body);
    } else {
      return null;
    }
  }
}
