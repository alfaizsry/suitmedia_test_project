import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:suitmedia_test_project/components/custom_appbar.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final JsonDecoder _decoder = const JsonDecoder();
  List userList = [];
  int currentPage = 1;
  int? maxPage;
  int itemPerPage = 10;

  getUserList() async {
    if (maxPage != null && currentPage == (maxPage! + 1)) return;
    String url = 'https://reqres.in/api/users?page=$currentPage&per_page=$itemPerPage';
    dynamic res = await http.get(Uri.parse(url)).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw Exception(response.reasonPhrase);
      }
      return _decoder.convert(response.body);
    });
    setState(() {
      userList = [...userList, ...res["data"]];
      maxPage = res['total_pages'];
      currentPage++;
    });
  }

  Future onRefresh() async {
    setState(() {
      userList = [];
      currentPage = 1;
    });
    getUserList();
  }

  @override
  void initState() {
    getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(context: context).defaultType('Third Screen'),
      body: LazyLoadScrollView(
          child: RefreshIndicator(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  shrinkWrap: true,
                  itemCount: userList.length,
                  itemBuilder: (context, i) {
                    Map data = userList[i];
                    return usernameCard(
                        imageUrl: data['avatar'],
                        firstName: data['first_name'],
                        lastName: data['last_name'],
                        email: data['email']);
                  }),
              onRefresh: onRefresh),
          onEndOfPage: () {
            getUserList();
          }),
    );
  }

  InkWell usernameCard({
    required String imageUrl,
    required String firstName,
    required String lastName,
    required String email,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, firstName + ' ' + lastName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300]?.withOpacity(0.3),
                radius: 25,
                foregroundImage: NetworkImage(imageUrl),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$firstName $lastName',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
