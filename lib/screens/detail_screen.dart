import 'package:car_find/models/car.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Car car;
  const DetailScreen({super.key, required this.car});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final car = widget.car;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DISCOVERY'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.nama,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 28.0),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 10),
                        borderRadius: BorderRadius.circular(20.0)),
                    width: double.infinity,
                    child: (car.imageUrl != null &&
                            Uri.parse(car.imageUrl!).isAbsolute
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              car.imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container()),
                  ),
                ],
              ),
            ),
            //
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.favorite)),
                      Text('129', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const Text(
                    'SPESIFIKASI',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  Row(
                    children: [
                      const Text('Brand :',
                          style: TextStyle(color: Colors.white)),
                      Text(car.brand,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Model :',
                          style: TextStyle(color: Colors.white)),
                      Text(car.model,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Tahun :',
                          style: TextStyle(color: Colors.white)),
                      Text(car.tahun,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Warna :',
                          style: TextStyle(color: Colors.white)),
                      Text(car.warna,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            //
            // Dealer
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DEALER TERSEDIA',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 10),
                        borderRadius: BorderRadius.circular(20.0)),
                    width: double.infinity,
                    child: (car.imageUrl != null &&
                            Uri.parse(car.imageUrl!).isAbsolute
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              car.imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container()),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              padding: const EdgeInsets.only(left: 8.0, bottom: 12.0),
              child: Column(
                children: [
                  const Text(
                    'LOKASI',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text('Toyota Auto2000 Veteran Palembang'),
                  Row(
                    children: [
                      const Text('Jalan :',
                          style: TextStyle(color: Colors.white)),
                      Text(car.jalan,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Kota :',
                          style: TextStyle(color: Colors.white)),
                      Text(car.kota,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('No. Telp :',
                          style: TextStyle(color: Colors.white)),
                      Text(car.noTelp,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Negara :',
                          style: TextStyle(color: Colors.white)),
                      Text(car.negara,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
