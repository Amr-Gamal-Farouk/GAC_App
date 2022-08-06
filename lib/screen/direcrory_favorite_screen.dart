import 'package:flutter/material.dart';
import 'package:gac/provider/user_provider.dart';
import 'package:gac/widget/employ_item.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        automaticallyImplyLeading: true,
      ),
      body:
       Consumer <UserProvider>(
        builder: (context, provider, child) {
          return(provider.favoriteEmployees.isEmpty)?const Center(child: Text("u didn't add any favorite yet!"),):
            ListView.builder(
              itemCount: provider.favoriteEmployees.length,
              itemBuilder: (context, index) {
                return  EmployItem(employ: provider.favoriteEmployees[index],);
              },
            );
        },
      ),
    );
  }
}
