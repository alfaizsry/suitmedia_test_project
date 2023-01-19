import 'package:flutter/material.dart';
import 'package:suitmedia_test_project/components/custom_appbar.dart';
import 'package:suitmedia_test_project/components/custom_button.dart';
import 'package:suitmedia_test_project/screens/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selected = 'Selected User Name';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(context: context).defaultType('Second Screen'),
      body: SafeArea(
          child: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                selected,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                child: CustomButtonBlue(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const ThirdScreen()))
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            selected = value;
                          });
                        }
                      });
                    },
                    label: 'Choose a User'))
          ],
        ),
      )),
    );
  }
}
