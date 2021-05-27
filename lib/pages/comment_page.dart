import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/new_comment_model.dart';

class CommentPage extends StatelessWidget {
  final Comment comment;

  const CommentPage({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comentarios'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Icon(
                Icons.account_circle_sharp,
                color: Colors.blueGrey,
              ),
              title: Text('ID:'),
              subtitle: Text(comment.id.toString()),
            ),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(
                Icons.account_box,
                color: Colors.blueGrey,
              ),
              title: Text('Nombre:'),
              subtitle: Text(comment.name),
            ),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.blueGrey,
              ),
              title: Text('Correo:'),
              subtitle: Text(comment.email),
            ),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(
                Icons.content_copy,
                color: Colors.blueGrey,
              ),
              title: Text('Contenido:'),
              subtitle: Text(comment.body),
            )
          ],
        ),
      ),
    );
  }
}
