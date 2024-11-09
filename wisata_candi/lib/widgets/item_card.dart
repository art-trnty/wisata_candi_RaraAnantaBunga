import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';

class ItemCard extends StatelessWidget {
  final Candi candi;
  // TODO: 1. Deklarasikan variabel yang dibutuhkan dan pasang pada konstruktor
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // TODO : 2. Tetapkan Parameter shape, margin, dan elevation dari Cari
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                candi.imageAsset,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              child: [
                Text(
                  candi.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],

              // TODO : 3. Buat Image sebagai anak dari Column
              // TODO : 4. Buat Text sebagai anak dari Column
              // TODO : 5. Buat Image sebagai anak dari Column
            ),
          ),
        ],
      ),
    );
  }
}
