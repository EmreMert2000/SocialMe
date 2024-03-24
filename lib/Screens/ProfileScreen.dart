// ProfileScreen.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final CollectionReference _userRef = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Düzenle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'İsim ve Soyisim',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'İsim'),
            ),
            TextFormField(
              controller: _surnameController,
              decoration: InputDecoration(labelText: 'Soyisim'),
            ),
            ElevatedButton(
              onPressed: () {
                _saveChanges();
              },
              child: Text('Kaydet'),
            ),
            SizedBox(height: 20),
            Text(
              'Yazılarınız',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Buraya yazılarınızın listelendiği bir widget gelecek
            // Şu an için boş bir Container koydum, veritabanı entegrasyonu yapıldığında bu widget ile değiştirilecek
            Container(
              height: 200,
              color: Colors.grey.shade200,
              child: Center(
                child: Text(
                  'Henüz bir yazınız bulunmamaktadır.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() {
    String name = _nameController.text.trim();
    String surname = _surnameController.text.trim();
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

    // Veritabanına kullanıcı bilgilerini kaydetme
    _userRef.doc(userId).set({
      'name': name,
      'surname': surname,
    }).then((_) {
      // Kayıt başarılıysa
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profil başarıyla güncellendi.'),
        backgroundColor: Colors.green,
      ));
    }).catchError((error) {
      // Hata durumunda
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profil güncelleme hatası: $error'),
        backgroundColor: Colors.red,
      ));
    });
  }
}
