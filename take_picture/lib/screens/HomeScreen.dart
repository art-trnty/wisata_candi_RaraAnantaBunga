import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _imageFile = '';
  final picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async{
    final pickedFile = await picker.pickImage(source: source);
    if(pickedFile != null) {
      setState(() {
        _imageFile = pickedFile.path;
      });
    }
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            ListTile(
              title: Text('Image Source',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                _getImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                _getImage(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:  Column(
          children: [
            _imageFile.isNotEmpty
                ? Image.file(
                  File(_imageFile),
                  height: 250,
                  fit: BoxFit.cover,
            )
                : Container(
                  color: Colors.grey,
                  height: 250,
                  width: double.infinity,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showPicker,
              child: const Text('Take Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
