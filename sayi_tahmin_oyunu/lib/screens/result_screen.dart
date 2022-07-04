import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  bool? sonuc;

  ResultScreen(this.sonuc,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData ekranOlcusu = MediaQuery.of(context);
    final double ekranGenisligi = ekranOlcusu.size.width;
    final double ekranYuksekligi = ekranOlcusu.size.height;
    return Scaffold(
      backgroundColor: sonuc!? Colors.white:Colors.red,
      appBar: AppBar(
        backgroundColor: sonuc!? Colors.blue:Colors.red,
        title: const Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                  sonuc! ? "KAZANDINIZ!":"KAYBETTİNİZ!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: ekranGenisligi / 15,
                  ))),
          SizedBox(
            width: ekranGenisligi / 2,
            height: ekranYuksekligi / 4,
            child:Icon(sonuc!? Icons.add_reaction_sharp: Icons.sports_kabaddi_outlined,
            size: ekranGenisligi/2)   //Image.asset("assets/zar.png")
          ),
          SizedBox(
            width: ekranGenisligi / 2,
            height: ekranYuksekligi / 15,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                child: const Text("Tekrar Oyna!")),
          ),
        ]),
      ),
    );
  }
}
