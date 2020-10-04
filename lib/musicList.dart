import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './songPage.dart';
class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}
class _SongListState extends State<SongList> {
  Future getdata() async {
    QuerySnapshot qn =
    await Firestore.instance.collection('songs').getDocuments();
    return qn.documents;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Songpage(
                                title:snapshot.data[index].data['song_name'],
                                url:snapshot.data[index].data['song_url'],
                                image:snapshot.data[index].data['image_url']))),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        snapshot.data[index].data['song_name'],
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),),),
                  elevation: 10.0,
                );},
            );}
        });
  }
}