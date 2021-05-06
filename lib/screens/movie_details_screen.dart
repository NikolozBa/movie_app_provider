import 'package:flutter/material.dart';
import 'package:movie_app/data/models/data_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = "/details-screen";

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context).settings.arguments;
    final Movie obj = Provider.of<DataModel>(context, listen: false).display[index];

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Center(
            child: Column(
              children: [
                Image.network(obj.imageUrl),
                Text(obj.category),
                Text(obj.releaseDate.toString()),
                Text(obj.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
