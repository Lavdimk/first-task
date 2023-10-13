import 'package:first_task/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'memeservice.dart';

class HomepageScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomepageScreen({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final MemeService memeService = MemeService();
  List<Map<String, String>> memes = [];
  int currentMemeIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchMemes();
  }

  Future<void> fetchMemes() async {
    try {
      final memeData = await memeService.fetchMemes();
      setState(() {
        memes = memeData;
      });
//       for (var meme in memes) {
//   print(' Name: ${meme['name']}');
// }
    } catch (e) {
      print('Error fetching memes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      theme: themeManager.isDarkMode
          ? themeManager.darkTheme
          : themeManager.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: themeManager.appBarColor,
          toolbarHeight: 100.0,
          title: Row(
            children: [
              const SizedBox(width: 140.0),
              const Text(
                'Home',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  themeManager.isDarkMode
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                ),
                onPressed: () {
                  themeManager.toggleTheme();
                },
              ),
            ],
          ),
        ),
        backgroundColor: themeManager.isDarkMode
            ? themeManager.darkTheme.backgroundColor
            : themeManager.lightTheme.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (memes.isNotEmpty)
                Image.network(
                  memes[currentMemeIndex]['url']!,
                  width: 400.0,
                  height: 400.0,
                ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    themeManager.isDarkMode
                        ? themeManager.darkTheme.buttonColor
                        : themeManager.lightTheme.buttonColor,
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(350, 50)),
                ),
                onPressed: () {
                  if (memes.isNotEmpty) {
                    currentMemeIndex = (currentMemeIndex + 1) % memes.length;
                    setState(() {});
                  }
                },
                child: const Text(
                  'Next Meme',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
