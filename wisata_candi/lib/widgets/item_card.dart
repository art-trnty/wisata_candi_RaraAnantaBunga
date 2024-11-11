import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  final Candi candi;
  // TODO: 1. Deklarasikan variabel yang dibutuhkan dan pasang pada konstruktor
  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    // TODO : 6. Implementai routing ke DetailScreen
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(candi: candi),
          ),
        );
      },
      child: Card(
        // TODO : 2. Tetapkan Parameter shape, margin, dan elevation dari Cari
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(4),
        elevation: 1,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // TODO : 3. Buat Image sebagai anak dari Column
          Expanded(
            // TODO : 7. Implementasi Hero animation
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  // TODO : 5. Buat Image sebagai anak dari Column
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // TODO : 4. Buat Text sebagai anak dari Column
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 8,
                  ),
                  child: Text(
                    candi.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    bottom: 8,
                  ),
                  child: Text(
                    candi.type,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//class ItemCard extends StatelessWidget {
//   // TODO : 1. Deklarasikan variabel yg dibutuhkan dan pasang pada konstruktor
//   final Candi candi;
// 
//   ItemCard({required this.candi}); // konstruktor candi
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO : 6. Implementasi routing ke DetailScreen
//     return Card(
//       // TODO : 2. Tetapkan parameter shape, margin, dan elevation dari Cari
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       margin: EdgeInsets.all(4),
//       elevation: 1,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // TODO : 3. Buat Image sebagai anak dari Column
//           Expanded(
//             // TODO : 7. Implementasi Hero animation
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.asset(
//                   candi.imageAsset,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           // TODO : 4. Buat Text sebagai anak dari Column
//           Padding(
//             padding: EdgeInsets.only(left: 16, top: 8),
//             child: Text(
//                 candi.name,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           // TODO : 5. Buat Text sebagai anak dari Column
//           Padding(
//             padding: EdgeInsets.only(left: 16, bottom: 8),
//             child: Text(
//               candi.type,
//               style: TextStyle(
//                 fontSize: 12,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
