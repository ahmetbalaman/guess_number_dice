import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/screens/guess_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final MediaQueryData _ekranOlcusu = MediaQuery.of(context);
    final double _ekranGenisligi = _ekranOlcusu.size.width;
    final double _ekranYuksekligi = _ekranOlcusu.size.height;




    return Scaffold(
      appBar: AppBar(
        title: const Text("Anasayfa"),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Tahmin Oyunu",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: _ekranGenisligi / 15,
                )),
            SizedBox(
              width: _ekranGenisligi / 2,
              height: _ekranYuksekligi / 4,
              child: Image.asset("assets/zar.png"),
            ),
            SizedBox(
              width: _ekranGenisligi / 2,
              height: _ekranYuksekligi / 15,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GuessScreen()));
                  },
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  child: const Text("OYUN BAŞLA!")),
            ),

          ],
        ),
      ),
    );
  }
}
