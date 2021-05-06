import 'package:flutter/material.dart';
import 'package:movie_app/data/models/data_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:provider/provider.dart';

class MainListItem extends StatelessWidget {
  final index;
  MainListItem(this.index);

  @override
  Widget build(BuildContext context) {

    final Movie obj = Provider.of<DataModel>(context, listen: false).display[index];

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: FadeInImage(
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/image_placeholder.jpg"),
                image: NetworkImage(obj.imageUrl),
              ),
            ),
            Text(obj.name),
            Text(obj.releaseDate.toString()),
          ],
        ),
      ),
    );
  }
}
