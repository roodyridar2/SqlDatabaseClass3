import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/pdfViewer/pdfGridPage.dart';
import 'package:sqlcheatcode/pages/quizApp/record_screen.dart';
import 'package:sqlcheatcode/pages/sqlSumulater/sql_screen.dart';

class NavDrawer extends ConsumerWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeChangerNotifierProvider);
    bool isDark = ref.watch(themeChangerNotifierProvider.notifier).getValue();
    final currentUser = FirebaseAuth.instance.currentUser;
    FocusScope.of(context).unfocus();

    return Drawer(
      child: Column(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     // color: Colors.green,
          //     image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image: AssetImage('assets/images/cover.png'),
          //     ),
          //   ),
          //   child: Text(
          //     'Side menu',
          //     style: TextStyle(color: Colors.white, fontSize: 25),
          //   ),
          // ),

          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                // colorFilter: ColorFilter.mode(
                //   isDark
                //       ? const Color.fromARGB(255, 75, 135, 77)
                //       : Colors.transparent,
                //   isDark ? BlendMode.color : BlendMode.color,
                // ),
                fit: BoxFit.cover,
                image: isDark
                    ? const AssetImage('assets/images/cover1.jpeg')
                    : const AssetImage('assets/images/cover2.jpeg'),
              ),
            ),
            child: const Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            currentUser!.email!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 1,
            thickness: 1,
          ),

          ListTile(
            leading: const Icon(Icons.picture_as_pdf_rounded),
            title: const Text('Course Book'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfGridCard(),
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text(
              'Sql Simulator',
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SqlSimulator(),
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_outlined),
            title: const Text(
              'Recodes',
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecordScreen(),
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),

          Switch(
            activeColor: Colors.green,
            value: ref.read(themeChangerNotifierProvider.notifier).getValue(),
            onChanged: (value) {
              ref.read(themeChangerNotifierProvider.notifier).toggleTheme();
            },
          ),
          const Spacer(),
          const ListTile(
            title: Text(
              "Version 1.0.0",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
