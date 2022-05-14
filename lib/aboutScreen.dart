import 'package:flutter/material.dart';
import 'package:weather_app/homeScreen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: const [Header(), FeedbackWidget()],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                Row(
                  children: const [
                    Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                    Text(
                      " Hakkında",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
                const Icon(null),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({Key? key}) : super(key: key);

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: clicked == false ? Colors.black54 : Colors.amber,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text(
                  "Bu uygulama Yunus Emre Koca tarafından geliştirilmiştir.",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    clicked = !clicked;
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Github: yunusekoca',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
