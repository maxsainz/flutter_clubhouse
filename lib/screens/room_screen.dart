import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/widgets/room_user_profile.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile_image.dart';
import '../data.dart';
import 'package:flutter/widgets.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({required this.room, Key? key}) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120.0,
        leading: TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(CupertinoIcons.chevron_down),
            label: const Text('All rooms')),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.doc,
                size: 28.0,
                color: Colors.black,
              )),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 20.0, 10.0),
              child:
                  UserProfileImage(imageUrl: currentUser.imageUrl, size: 36.0),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${room.club} 🏠'.toUpperCase(),
                          style: Theme.of(context).textTheme.overline!.copyWith(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.0,
                              ),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: const Icon(CupertinoIcons.ellipsis)),
                      ],
                    ),
                    Text(
                      room.name,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                    )
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20.0),
                sliver: SliverGrid.count(
                    mainAxisSpacing: 20.0,
                    crossAxisCount: 3,
                    children: room.speakers
                        .map(
                          (e) => RoomUserProfile(
                            imageUrl: e.imageUrl,
                            name: e.givenName,
                            isNew: Random().nextBool(),
                            isMuted: Random().nextBool(),
                          ),
                        )
                        .toList()),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Followed by speakers',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20.0),
                sliver: SliverGrid.count(
                    mainAxisSpacing: 20.0,
                    crossAxisCount: 4,
                    childAspectRatio: 0.7,
                    children: room.followedBySpeakers
                        .map(
                          (e) => RoomUserProfile(
                            imageUrl: e.imageUrl,
                            name: e.givenName,
                            isNew: Random().nextBool(),
                          ),
                        )
                        .toList()),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Others in room',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20.0),
                sliver: SliverGrid.count(
                    mainAxisSpacing: 20.0,
                    crossAxisCount: 4,
                    childAspectRatio: 0.7,
                    children: room.others
                        .map(
                          (e) => RoomUserProfile(
                            imageUrl: e.imageUrl,
                            name: e.givenName,
                            isNew: Random().nextBool(),
                          ),
                        )
                        .toList()),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 100.0))
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 80,
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                  Theme.of(context).scaffoldBackgroundColor,
                ])),
          ),
        ),
      ]),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          height: 100.0,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(24.0)),
                    child: const Text.rich(TextSpan(children: [
                      TextSpan(
                        text: '✌️',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      WidgetSpan(child: SizedBox(width: 5.0)),
                      TextSpan(
                          text: 'Leave quietly',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0))
                    ])),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        child: const Icon(CupertinoIcons.add, size: 30.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        child:
                            const Icon(CupertinoIcons.hand_raised, size: 30.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                      ),
                    )
                  ],
                )
              ])),
    );
  }
}
