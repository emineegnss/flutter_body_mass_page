import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'input_page_2.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0;
  double sporGunu = 0;
  int boy = 160;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue[200],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[200],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: RowMethod("Boy", boy),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: RowMethod("Kilo", kilo),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haftada kaç gün spor yapıyorsunuz?",
                      textAlign: TextAlign.center,
                      style: yaziStili,
                    ),
                    Text("${sporGunu.round()}", style: sayiStili),
                    Slider(
                        min: 0,
                        max: 7,
                        divisions: 7,
                        value: sporGunu,
                        onChanged: (double newValue) {
                          setState(() {
                            sporGunu = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Günde Kaç Sigara İçiyorsunuz?",
                      style: yaziStili,
                    ),
                    Text(
                      "${icilenSigara.round()}",
                      style: sayiStili,
                    ),
                    Slider(
                        min: 0,
                        max: 30,
                        value: icilenSigara,
                        onChanged: (double newValue) {
                          setState(() {
                            icilenSigara = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "KADIN";
                        });
                      },
                      renk: seciliCinsiyet == "KADIN" ? Color.fromARGB(255, 105, 170, 200) : Colors.white,
                      child: IconCinsiyet(
                        cinsiyet: "KADIN",
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                        onPress: () {
                          setState(() {
                            seciliCinsiyet = "ERKEK";
                          });
                        },
                        renk: seciliCinsiyet == "ERKEK" ? Color.fromARGB(255, 105, 170, 200) : Colors.white,
                        child: IconCinsiyet(
                          cinsiyet: "ERKEK",
                          icon: FontAwesomeIcons.mars,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row RowMethod(String text, int deger) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            text,
            style: yaziStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            "$deger",
            style: sayiStili,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            ButtonTheme(
                minWidth: 36,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (text == "Boy") {
                          boy++;
                        } else {
                          kilo++;
                        }
                      });
                    },
                    child: Icon(Icons.add))),
            SizedBox(
              height: 5,
            ),
            ButtonTheme(
              minWidth: 36,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (text == "Boy") {
                      boy--;
                    } else {
                      kilo--;
                    }
                  });
                },
                child: Icon(Icons.remove),
              ),
            ),
          ],
        )
      ],
    );
  }
}
