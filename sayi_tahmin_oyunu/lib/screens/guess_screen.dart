import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/screens/result_screen.dart';

class GuessScreen extends StatefulWidget {
  const GuessScreen({Key? key}) : super(key: key);

  @override
  State<GuessScreen> createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  TextEditingController _tahminKontrol = TextEditingController();
  int hakSayisi = 4, tahmin = 0, random = 0;
  String help = "Once Yaz";
  Random randomDice = Random();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    random = randomDice.nextInt(6) + 1;
    print("sayı :$random + hak sayisi :$hakSayisi");
  }

  @override
  void dispose() {
    _tahminKontrol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData ekranOlcusu = MediaQuery.of(context);
    final double ekranGenisligi = ekranOlcusu.size.width;
    final double ekranYuksekligi = ekranOlcusu.size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kalan Hak: $hakSayisi",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: ekranGenisligi / 15,
                )),
            SizedBox(
                width: ekranGenisligi / 2,
                height: ekranYuksekligi / 4,
                child: Text("Yardım:$help",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: ekranGenisligi / 15,
                    ))),
            TextField(
              controller: _tahminKontrol,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Tahmin", border: OutlineInputBorder()),
              textAlign: TextAlign.center,
              maxLength: 3,
            ),
            SizedBox(
              width: ekranGenisligi / 2,
              height: ekranYuksekligi / 15,
              child: ElevatedButton(
                  onPressed: _tahminKontrol.text.isEmpty
                      ? null
                      : () {
                          tahmin = int.parse(_tahminKontrol.text);
                          hakSayisi--;
                          if (tahmin == random) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultScreen(true)));
                          } else if (tahmin > random) {
                            setState(() {
                              help = "Tahmini Azalt!";

                            });
                          } else if (tahmin < random) {
                            setState(() {
                              help = "Tahmini Arttır!";

                            });

                            if (hakSayisi <= 0) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResultScreen(false)));
                              print("çalışıyor");
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(), primary: Colors.red),
                  child: const Text("Tahmin et!")),
            ),
          ],
        ),
      ),
    );
  }
}
