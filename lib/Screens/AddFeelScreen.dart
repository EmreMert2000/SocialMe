import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFeelScreen extends StatelessWidget {
  final TextEditingController _feelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hissinizi Ekle'),
      ),
      body: Container(
        color: Colors.blue, // Arka plan rengi
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Özgürce ne düşünüyorsanız yazın:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _feelController,
              maxLines: 5, // Çok satırlı metin girişi için
              decoration: InputDecoration(
                border: OutlineInputBorder(), // Kenarlık eklemek için
                hintText: 'Düşüncelerinizi buraya yazın',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _shareFeel(context);
              },
              child: Text('Paylaş'),
            ),
          ],
        ),
      ),
    );
  }

  void _shareFeel(BuildContext context) {
    String feel = _feelController.text.trim();
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

    if (feel.isNotEmpty && userId.isNotEmpty) {
      // Firestore veritabanına hissi eklemek için referans alınır
      CollectionReference feelsRef = FirebaseFirestore.instance.collection('feels');

      // Hissi Firestore'a eklemek için bir döküman oluşturulur
      feelsRef.add({
        'userId': userId,
        'feel': feel,
        'timestamp': FieldValue.serverTimestamp(),
      }).then((_) {
        // His paylaşma başarılıysa
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Hissiniz başarıyla paylaşıldı.'),
          backgroundColor: Colors.green,
        ));
      }).catchError((error) {
        // Hata durumunda
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Hissinizi paylaşırken bir hata oluştu: $error'),
          backgroundColor: Colors.red,
        ));
      });
    } else {
      // His veya kullanıcı kimliği boşsa hata mesajı gösterilir
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Lütfen bir his yazın.'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
