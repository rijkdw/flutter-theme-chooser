import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:themechanger/models/post.dart';
import 'package:themechanger/repositories/postrepository.dart';
import 'package:themechanger/screens/home/drawer.dart';

class HomePage extends StatelessWidget {
  
  final title;
  HomePage({this.title});

  

  

  @override
  Widget build(BuildContext context) {

    Widget _loadingWidget = SpinKitWave(
      size: 40,
      color: Theme.of(context).accentColor,
    );

    Widget _errorWidget = Column(
      children: <Widget>[
        Icon( Icons.error ),
        Text( 'An error occurred' ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<FakePostRepository>(context).getPosts(),
        builder: (context, snapshot) {

          List<Post> posts = snapshot.data;

          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: _loadingWidget,
            );
          }
          
          if (snapshot.hasData) {      
            return ListView.builder(
              itemCount: posts.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {

                Post post = posts[index];

                return Card(
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: ExpansionTile(
                    title: Text( post.title ),
                    leading: CircleAvatar(
                      
                    ),
                    children: <Widget>[

                    ],
                  ),
                );
              },
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: _errorWidget,
            );
          }

          return Center(
            child: _errorWidget,
          );
        },
      )
    );
  }
}
