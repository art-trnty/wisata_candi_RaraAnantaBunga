import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final dynamic candi;

  // TODO: 1. Deklarasikan variabel yang dibutuhkan dan pasang pada konstruktor
  const ItemCard({required this.candi, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: 6. Implementasi routing ke DetailScreen
    return Card(
      //TODO: 2. Tetapkan parameter shape, margin, dan elevation dari Cari
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: 3. Buat Image sebagai anak dari Column
          Expanded(
            //TODO: 7. Implementasi Hero animator
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                candi.imageAsset,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              candi.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Text(
              candi.type,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          // TODO: 4. Buat Text sebagai anak dari Column
          // TODO: 5. Buat Tect sebagai anak dari Column
        ],
      ),
    );
  }
}