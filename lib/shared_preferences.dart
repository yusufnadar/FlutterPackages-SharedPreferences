import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {


  SharedPreferences? preferences;
  bool? deger;
  String? deger3;

  @override
  void initState() {
    super.initState();
    init();
  }

  init()async{
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: ()async{
              var deger2 = await preferences!.setString('stringim', 'başarılı');
              print(deger2);
            }, child: const Text('Set Value')),
            ElevatedButton(onPressed: ()async{

              var test  =  preferences!.getKeys();
                print(test);

            }, child: const Text('Get Value')),
            Text(deger3 != null ? deger3.toString() : 'Boş'),
          ],
        ),
      ),
    );
  }
}
