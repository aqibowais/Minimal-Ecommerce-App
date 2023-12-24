import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback? toggleTheme;
  const SettingPage(
      {super.key, required this.isDarkMode, required this.toggleTheme});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed: widget.toggleTheme != null
                      ? widget.toggleTheme!
                      : () {}, // Null check
                  icon: Icon(
                    widget.isDarkMode
                        ? Icons.toggle_on
                        : Icons.toggle_off_sharp,
                    size: 50,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
