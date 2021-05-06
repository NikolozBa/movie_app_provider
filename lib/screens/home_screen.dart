import 'package:flutter/material.dart';
import 'package:movie_app/data/models/data_model.dart';
import 'package:movie_app/widgets/main_list_item.dart';
import 'package:provider/provider.dart';

import 'add_new_movie_scren.dart';
import 'edit_movie_screen.dart';
import 'movie_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              TextButton(
                onPressed: () {
                  Provider.of<DataModel>(context, listen: false).filterRecentlyAdded();
                  Navigator.pop(context);
                },
                child: Text('Recently Added'),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Provider.of<DataModel>(context, listen: false).filterFavorites();
                  Navigator.pop(context);
                },
                child: Text('My Favorites'),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Provider.of<DataModel>(context, listen: false).filterReset();
                  Navigator.pop(context);
                },
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<DataModel>(
        builder: (context, dataObj, child){

          return ListView.builder(
            itemBuilder: (ctx, index) {
              return Dismissible(
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    MovieDetailsScreen.routeName,
                    arguments: index,
                  ),
                  onLongPress: () {
                    Navigator.pushNamed(
                      context,
                      EditMovieScreen.routeName,
                      arguments: index,
                    );
                  },
                  child: MainListItem(index),
                ),
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Are you sure?"),
                    content: Text("Do you really want to delete this movie?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("NO"),
                      ),
                      TextButton(
                          onPressed: () {
                            Provider.of<DataModel>(context, listen: false).removeMovie(index);
                            Navigator.pop(context);
                          },
                          child: Text("YES"))
                    ],
                  ),
                ),
              );
            },
            itemCount: Provider.of<DataModel>(context, listen: false).display.length,
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AddNewMovieScreen.routeName),
        child: Icon(Icons.add),
      ),
    );
  }
}
