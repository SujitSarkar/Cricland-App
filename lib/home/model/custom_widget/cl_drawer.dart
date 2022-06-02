import 'package:cricland/home/model/custom_widget/constants.dart';
import 'package:cricland/public/variables/colors.dart';
import 'package:flutter/material.dart';

class CLDrawer extends StatelessWidget {
  const CLDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                const Icon(
                  Icons.directions_boat,
                  size: 48,
                  color: AllColor.primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Adventure Launch",
                    style: CLTextStyle.buttonText.copyWith(
                      fontSize: 16,
                      color: AllColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < 1; i++)
            ListTile(
              leading: Icon(Icons.arrow_forward_ios_rounded),
              title: Text("Drawer Item"),
            ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios_rounded),
            title: Text("Terms and Coniditons"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios_rounded),
            title: Text("Disclaimer"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios_rounded),
            title: Text("About Us"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios_rounded),
            title: Text("Privacy Policy"),
            onTap: () {},
          ),
          const Spacer(),
          for (int i = 0; i < 2; i++)
            ListTile(
              leading: Icon(Icons.social_distance_outlined),
              title: Text("Social Link"),
            ),
        ],
      ),
    ));
  }
}
