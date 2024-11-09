import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_candi/models/candi.dart';

class DetailScreen extends StatefulWidget {
  final Candi candi;
  const DetailScreen({super.key, required this.candi});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _checkSignInStatus();
    _loadFavoriteStatus();
  }

  // Memeriksa status sign in
  void _checkSignInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool signedIn = prefs.getBool('isSignedIn') ?? false;
    setState(() {
      isSignedIn = signedIn;
    });
  }

  // Memeriksa status favorite
  void _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool favorite = prefs.getBool('favorite_${widget.candi.name}') ?? false;
    setState(() {
      isFavorite = favorite;
    });
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Memeriksa apakah pengguna sudah sign in
    if (!isSignedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/signin');
      });
      return;
    }

    bool favoriteStatus = !isFavorite;
    prefs.setBool('favorite_${widget.candi.name}', favoriteStatus);

    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.candi.imageAsset,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100]?.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                //atas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.candi.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        _toggleFavorite();
                      },
                      icon: Icon(
                        isSignedIn && isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isSignedIn && isFavorite ? Colors.red : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),

                //tengah
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                      width: 70,
                      child: Text(
                        'Lokasi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(": ${widget.candi.location}")
                  ],
                ),
                //bawah
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                      width: 70,
                      child: Text(
                        'Dibangun',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(": ${widget.candi.built}")
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.house,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                      width: 70,
                      child: Text(
                        'Tipe',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(": ${widget.candi.type}")
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Divider(
                  color: Colors.deepPurple.shade100,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Deskripsi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(widget.candi.description)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: Colors.deepPurple.shade100,
                ),
                const Text('Galeri',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.candi.imageUrls.length,
                    itemBuilder: (content, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.deepPurple.shade100,
                                width: 2,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: widget.candi.imageUrls[index],
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  width: 120,
                                  height: 120,
                                  color: Colors.deepPurple[50],
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Tap untuk memperbesar',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
