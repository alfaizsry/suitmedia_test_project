import 'package:flutter/material.dart';
import 'package:suitmedia_test_project/components/custom_alert.dart';
import 'package:suitmedia_test_project/components/custom_button.dart';
import 'package:suitmedia_test_project/components/custom_text_form.dart';
import 'package:suitmedia_test_project/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isPalindrome = false;
  TextEditingController name = TextEditingController();
  TextEditingController palindrome = TextEditingController();

  String clearingText(String str) {
    str = str.replaceAll(' ', '');
    str = str.replaceAll('  ', '');
    str = str.replaceAll('-', '');
    return str;
  }

  palindromeChecking() {
    String normalText = clearingText(palindrome.text);
    String reverseText = clearingText(palindrome.text).split('').reversed.join('');
    setState(() {
      isPalindrome = normalText == reverseText;
    });
    String labelAlert = palindrome.text.isEmpty
        ? 'please fill in the palindrome field first!'
        : isPalindrome
            ? 'isPalindrome'
            : 'not palindrome';
    Color? colorAlert = palindrome.text.isEmpty
        ? Colors.orange[900]
        : isPalindrome
            ? Colors.green[600]
            : Colors.red[700];
    CustomAlert(context: context).alertDialog(label: labelAlert, colors: colorAlert);
  }

  onClickNext() {
    if (name.text.isEmpty) {
      CustomAlert(context: context)
          .alertDialog(label: 'please fill in the name field first!', colors: Colors.red);
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SecondScreen(name: name.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/e175/1e90/5ea2a92c2d7771c7921246067122c2e9?Expires=1675036800&Signature=jcHQ17CesAkirfRglNVpG2RqerkgBt6J~Gw7E9f3-iSbmNOyf5kJGuf99DodaWU0VUscV8cR7QGCUdAmc8Dtd6L47FKQ0SPuWIR5BfgDlG5Gwv8x9wZqjj6kZiIvobur~oe3UIaXiEJ~-cNpelSglxWZ3Gb9hPB6mdY5p8A4RCy1GhBAxOCU9tAQB61tXm0ShNsx8kSKcYE8e2bxbZnFu3oRS3cP0Hd3UeWeUM-8sEAH295N4q3hT9FPKSXqChYIJMpgl54B2kDoUDUVnCXyp8VQyYFerxRZTfheYw-d4eIXbevATcldVq0Y2ZIMzcgkzytcW-4XsUHuAmLcKxeqcg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300]?.withOpacity(0.3),
                  radius: 58,
                  child: const Icon(
                    Icons.person_add_alt_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(
                  height: 56,
                ),
                CustomTextForm(
                  controller: name,
                  hintText: 'Name',
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextForm(
                  controller: palindrome,
                  hintText: 'Palindrome',
                ),
                const SizedBox(
                  height: 45,
                ),
                CustomButtonBlue(
                  onTap: () => palindromeChecking(),
                  label: 'CHECK',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButtonBlue(
                  onTap: () => onClickNext(),
                  label: 'NEXT',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
