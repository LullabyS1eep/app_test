import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photo_album/Pages/take_photo_page.dart';
import 'dart:convert';
import 'album_details_page.dart';

class AlbumListPage extends StatefulWidget {
  final int userId;

  AlbumListPage({required this.userId});

  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  List<dynamic> albums = [];

  @override
  void initState() {
    super.initState();
    fetchAlbums();
  }

   Future<void> fetchAlbums() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums?userId=${widget.userId}'));
    if (response.statusCode == 200) {
      setState(() {
        albums = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load albums');
    }
  }

  void _navigateToTakePhotoPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePhotoPage(),
      ),
    );
  }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(albums[index]['title']),
            onTap: () {
      
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumDetailsListPage(albumId: albums[index]['id']),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToTakePhotoPage,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}