import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/app_size.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import '../../../widgets/custom_Text_Widget.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final auth = FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.tertiaryColor,
      body: Column(
        children: [
          20.h,
          const Align(
            alignment: Alignment.topCenter,
            child: CustomText(
              text: 'User Details',
              color: globalColors.BlackColor,
              fontsize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: auth,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: globalColors.primaryColor,
                      ),
                      10.h,
                      const Text('Loading'),
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return const Text('Have Some Eror');
              }
              return Expanded(
                  child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: globalColors.GreyColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: globalColors.primaryColor,
                            child: CustomText(
                              text: "${index + 1}",
                              color: globalColors.BlackColor,
                              fontsize: 20,
                            ),
                          ),
                          title: FittedBox(
                            child: Row(
                              children: [
                                const CustomText(
                                  text:
                                      "Email: ",
                                  color: globalColors.BlackColor,
                                  fontsize: 16,
                                ),
                                CustomText(
                                  text:
                                      snapshot.data!.docs[index]['email'].toString(),
                                  color: globalColors.BlackColor,
                                  fontsize: 12,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              const CustomText(
                                  text:
                                      "Password: ",
                                  color: globalColors.BlackColor,
                                  fontsize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              CustomText(
                                text:
                                    snapshot.data!.docs[index]['password'].toString(),
                                color: globalColors.BlackColor,
                                fontsize: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
