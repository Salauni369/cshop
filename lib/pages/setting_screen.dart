
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true, // keeps title centered
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.person),
            title: Text("Account"),
            subtitle: Text("Privacy, Security, Hide Orders"),
          ),
          const Divider(),

          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            subtitle: Text("Message, group & call tones"),
          ),
          const Divider(), 
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text("Dark Mode"),
            value: darkMode,
            onChanged: (bool value) {
              setState(() {
                darkMode = value;
              });
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            subtitle: const Text("App version, developer info"),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Coffee App",
                applicationVersion: "1.0.0",
                applicationLegalese: "© 2025 Coffee Lovers Inc.",
              );
            },
          ),
        ],
      ),
    );
  }
}
