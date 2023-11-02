import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSosmedTile extends StatelessWidget {
  final String name;
  final String SosmedName;
  final IconData iconData;
  final VoidCallback onTap;

  CustomSosmedTile({
    required this.name,
    required this.SosmedName,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(16.0),
            leading: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.blue,
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            title: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 18.0,
                ),
                SizedBox(width: 8.0),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Icon(
                  Icons.alternate_email,
                  color: Colors.blue,
                  size: 18.0,
                ),
                SizedBox(width: 8.0),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    SosmedName,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaPage extends StatelessWidget {
  final String username;

  SocialMediaPage({required this.username});

  void launchSocialMedia(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final List<Map<String, dynamic>> socialMediaList = [
    {
      'name': 'Instagram',
      'SosmedName': 'halorumah.pkmk',
      'iconData': FontAwesomeIcons.instagram,
      'url': 'https://instagram.com/halorumah.pkmk?igshid=OGQ5ZDc2ODk2ZA==',
    },
    {
      'name': 'TikTok',
      'SosmedName': 'halo.rumah',
      'iconData': FontAwesomeIcons.tiktok,
      'url': 'https://www.tiktok.com/@halo.rumah?_t=8gTZJM0qVBC&_r=1',
    },
    {
      'name': 'Facebook',
      'SosmedName': 'Halo Rumah',
      'iconData': FontAwesomeIcons.facebook,
      'url':
          'https://www.facebook.com/profile.php?id=100093573952095&mibextid=ZbWKwL',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                stops: [0, 0.3, 0.6, 1],
                colors: [
                  Color.fromARGB(255, 255, 0, 0),
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.4),
                ],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                title: Text(
                  "Social Media Page",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 19 / 16,
                    letterSpacing: 0.1,
                    color: Colors.black87,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, left: 24),
                  child: ListView.builder(
                    itemCount: socialMediaList.length,
                    itemBuilder: (context, index) {
                      final sosmed = socialMediaList[index];
                      return CustomSosmedTile(
                        name: sosmed['name'] ?? '',
                        SosmedName: sosmed['SosmedName'] ?? '',
                        iconData:
                            sosmed['iconData'] ?? FontAwesomeIcons.question,
                        onTap: () {
                          launchSocialMedia(sosmed['url']);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
