import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile_image.dart';

class RoomUserProfile extends StatelessWidget {
  const RoomUserProfile(
      {required this.imageUrl,
      required this.name,
      this.size = 66.0,
      this.isNew = false,
      this.isMuted = false,
      Key? key})
      : super(key: key);

  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              child: UserProfileImage(
                imageUrl: imageUrl,
                size: size,
              ),
            ),
            if (isNew)
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      '🎉',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ]),
                  )),
            if (isMuted)
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Icon(CupertinoIcons.mic_slash_fill),
                    padding: const EdgeInsets.all(4.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ]),
                  ))
          ],
        ),
        SizedBox(height: 4.0,),
        Flexible(
          child: Text(
            name,
          overflow: TextOverflow.ellipsis,
        )),
      ],

    );
  }
}
