import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Image.asset("lib/banner.jpg",fit: BoxFit.fill,height: 120.0,),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.language),
          ),
          title: Text("本地疫情"),
          onTap: () => Navigator.pushNamed(context, "/Local"),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.assessment),
          ),
          title: Text("最新进展"),
          onTap: () => Navigator.pushNamed(context, '/Now'),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.local_hospital),
          ),
          title: Text("预防措施"),
          onTap: () => Navigator.pushNamed(context, '/Prevent'),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.train),
          ),
          title: Text("同行程查询"),
          onTap: () => Navigator.pushNamed(context, "/Traffic"),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.room),
          ),
          title: Text("同小区查询"),
          onTap: () => Navigator.pushNamed(context, "/Community"),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.edit),
          ),
          title: Text("在家学习"),
          onTap: () => Navigator.pushNamed(context, "/Study"),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.search),
          ),
          title: Text("资源搜索"),
          onTap: () => Navigator.pushNamed(context, "/Source"),
        ),
        Divider(),
      ],
    );
  }
}
