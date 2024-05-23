import 'package:car_find/components/my_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _tahunController = TextEditingController();
  final TextEditingController _warnaController = TextEditingController();
  final TextEditingController _jalanController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();
  final TextEditingController _negaraController = TextEditingController();

  Future<void> _postToFirestore() async {
    // Trim seluruh text dari controller
    String nama = _namaController.text.trim();
    String brand = _brandController.text.trim();
    String model = _modelController.text.trim();
    String tahun = _tahunController.text.trim();
    String warna = _warnaController.text.trim();
    String jalan = _jalanController.text.trim();
    String kota = _kotaController.text.trim();
    String noTelp = _noTelpController.text.trim();
    String negara = _negaraController.text.trim();

    // Cek apakah text field terisi atau tidak
    if (nama.isEmpty ||
        brand.isEmpty ||
        model.isEmpty ||
        tahun.isEmpty ||
        warna.isEmpty ||
        jalan.isEmpty ||
        kota.isEmpty ||
        noTelp.isEmpty ||
        negara.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Semua bagian harus diisi sebelum upload!')),
      );
      return;
    } else {
      try {
        await FirebaseFirestore.instance.collection('cars').add({
          'nama': nama,
          'brand': brand,
          'model': model,
          'tahun': tahun,
          'warna': warna,
          'jalan': jalan,
          'kota': kota,
          'noTelp': noTelp,
          'negara': negara,
          'timestamp': FieldValue.serverTimestamp(),
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Berhasil upload!')),
          );
        }

        Navigator.pop(context);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Gagal post, coba lagi beberapa saat!')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyTextField(
                  controller: _namaController,
                  hintText: 'Nama',
                  obscureText: false),
              MyTextField(
                  controller: _brandController,
                  hintText: 'Brand',
                  obscureText: false),
              MyTextField(
                  controller: _modelController,
                  hintText: 'Model',
                  obscureText: false),
              MyTextField(
                  controller: _tahunController,
                  hintText: 'Tahun',
                  obscureText: false),
              MyTextField(
                  controller: _warnaController,
                  hintText: 'Warna',
                  obscureText: false),
              MyTextField(
                  controller: _jalanController,
                  hintText: 'Jalan Dealer',
                  obscureText: false),
              MyTextField(
                  controller: _kotaController,
                  hintText: 'Kota Dealer',
                  obscureText: false),
              MyTextField(
                  controller: _noTelpController,
                  hintText: 'Nomor Telepon',
                  obscureText: false),
              MyTextField(
                  controller: _negaraController,
                  hintText: 'Negara',
                  obscureText: false),
              //
              //
              const SizedBox(height: 64.0),
              //
              //
              ElevatedButton(
                onPressed: _postToFirestore,
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
