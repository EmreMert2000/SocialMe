import 'package:flutter/material.dart';

class AddFeelScreen extends StatelessWidget {
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
              maxLines: 5, // Çok satırlı metin girişi için
              decoration: InputDecoration(
                border: OutlineInputBorder(), // Kenarlık eklemek için
                hintText: 'Düşüncelerinizi buraya yazın',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // His paylaşma işlemi burada yapılacak
              },
              child: Text('Paylaş'),
            ),
          ],
        ),
      ),
    );
  }
}
