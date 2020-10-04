import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import'./uploadmusic.dart';
import'./musicList.dart';

class Music extends StatefulWidget {
  MusicState createState() => MusicState();
}

class MusicState extends State<Music> {
  void startAddNewMusic(BuildContext ctx)
  {
    showModalBottomSheet(context: ctx, builder: (_){
      return  GestureDetector(
        onTap: () {} ,
        child:Upload(),
        behavior: HitTestBehavior.opaque,
      );
    }
    );
  }
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SongList(),
      floatingActionButtonLocation:  FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => startAddNewMusic(context),
        ),
    );
  }
}