import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AlbumDetailsListPage extends StatefulWidget {
  final int albumId;

  AlbumDetailsListPage({required this.albumId});

  @override
  _AlbumDetailsListPageState createState() => _AlbumDetailsListPageState();
}

class _AlbumDetailsListPageState extends State<AlbumDetailsListPage> {
  List<dynamic> photos = [];

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/${widget.albumId}/photos'));
    if (response.statusCode == 200) {
      setState(() {
        photos = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album Details'),
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(photos[index]['title']),
            leading: Image.network(photos[index]['thumbnailUrl']),
            
          );
        },
      ),
    );
  }
}
