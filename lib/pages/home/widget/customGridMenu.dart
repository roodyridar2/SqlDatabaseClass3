import 'package:flutter/material.dart';

class CustomGridMenu extends StatelessWidget {
  const CustomGridMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 4, // Change this based on the number of items you want
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Handle item tap
              print('Tapped on item $index');
            },
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Item $index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// PopupMenuButton<int>(
//                   // color: Colors.transparent,
//                   // elevation: 0,
//                   itemBuilder: (context) => [
//                     const PopupMenuItem(
//                       value: 1,
//                       child: Center(child: CustomGridMenu()),
//                     ),
//                   ],
//                   onSelected: (value) {
                    
//                     // Handle menu item selection
//                     print('Selected value: $value');
//                   },
//                 )