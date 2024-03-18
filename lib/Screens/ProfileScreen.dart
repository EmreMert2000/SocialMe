import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Profilinizi Düzenleyin',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

              },
              child: SizedBox(
                width: 400,
                height: 400,
                child: Center(
                  child: Text(
                    'Fotoğraf Seç',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'İsminizi Düzenleyin',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Soy isminizi Düzenleyin',
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Kaydetme işlemi burada yapılacak
              },
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
