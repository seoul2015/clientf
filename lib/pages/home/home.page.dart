import 'package:clientf/flutter_engine/engine.globals.dart';
import 'package:clientf/flutter_engine/widgets/engine.app_bar.dart';
import 'package:clientf/flutter_engine/widgets/engine.latest_posts.dart';
import 'package:clientf/flutter_engine/widgets/engine.text.dart';
import 'package:clientf/services/app.service.dart';

import '../../flutter_engine/engine.forum.dart';
import 'package:clientf/globals.dart';
import 'package:clientf/services/app.defines.dart';

import 'package:clientf/widgets/app.drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EngineForum forum = EngineForum();
  _HomePageState() {
    //
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EngineAppBar(
        title: t('appName'),
        onTapUserPhoto: () =>
            open(ef.loggedIn ? AppRoutes.register : AppRoutes.login),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HomeTopMenus(),
            EngineLatestPosts(
              'discussion',
              onTap: (post) =>
                  open(AppRoutes.postView, arguments: {'post': post}),
              onError: (e) => AppService.alert(null, t(e)),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTopMenus extends StatelessWidget {
  const HomeTopMenus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            open(AppRoutes.postList, arguments: {'id': 'discussion'});
          },
          child: T('Discussion'),
        ),
        RaisedButton(
          onPressed: () {
            open(AppRoutes.postList, arguments: {'id': 'qna'});
          },
          child: T('QnA'),
        ),
        RaisedButton(
          onPressed: () {
            open(AppRoutes.postList, arguments: {'id': 'qna'});
          },
          child: T('News'),
        ),
      ],
    );
  }
}
