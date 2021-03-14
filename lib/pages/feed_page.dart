import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_ui_clone/model/post_model.dart';
import 'package:instagram_ui_clone/model/story_model.dart';
class FeedPage extends StatefulWidget {
  static final String id = "feed_page";
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List <Story> _stories = [
   Story ("assets/images/user_1.jpg", "Jasmin"),
    Story ("assets/images/user_2.jpg", "Silvester"),
    Story ("assets/images/user_3.jpg", "Lavina"),
    Story ("assets/images/user_1.jpg", "Jasmin"),
    Story ("assets/images/user_2.jpg", "Silvester"),
    Story ("assets/images/user_3.jpg", "Lavina"),

  ];

  List <Post> _posts = [
  Post(
    userName: "Brianne",
    userImage: "assets/images/user_1.jpg",
    posImage: "assets/images/feed_1.jpg",
    caption: "World with you amazing. I love flutter",
  ),
    Post(
      userName: "Strange",
      userImage: "assets/images/user_2.jpg",
      posImage: "assets/images/feed_2.jpg",
      caption: "World with you amazing. I love flutter",
    ),
    Post(
      userName: "Alina",
      userImage: "assets/images/user_3.jpg",
      posImage: "assets/images/feed_3.jpg",
      caption: "World with you amazing. I love flutter",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              // #STORIES AND WATCH
              Container(

                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Stories", style: TextStyle(color: Colors.grey, fontSize: 14),),
                    Text("Watch",style: TextStyle(color: Colors.grey, fontSize: 14),),
                  ],
                ),
              ),
              // # STORIES LIST
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story) {
                    return _itemOfStory (story);
                  }).toList(),
                ),
              ),

              // #POST LIST
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i) {
                    return _itemOfPost(_posts[i]);
                  },

                ),
              ),


            ],
          )
        ),
      ),
    );
  }
  Widget _itemOfPost (Post post) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          // #Header - userImage, name and more button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.userName, style: TextStyle(color: Colors.grey),),
                  ],
                ),
                IconButton(
                 icon: Icon(SimpleLineIcons.options),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // image
          FadeInImage(
          image: AssetImage(post.posImage),
          placeholder: AssetImage("assets/images/placeholder.png",),
            width: MediaQuery.of(context).size.width,
          ),
          // #BUTTONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(FontAwesome.heart_o),
                    color: Colors.grey,
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(FontAwesome.comment_o),
                    color: Colors.grey,
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(FontAwesome.send_o),
                    color: Colors.grey,
                    onPressed: (){},
                  ),
                ],
              ),
              IconButton(
                icon: Icon(FontAwesome.bookmark_o),
                color: Colors.grey,
                onPressed: (){},
              ),
            ],
          ),
          // #TAGS
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Like By",
                    style: TextStyle(color: Colors.grey),

                  ),
                  TextSpan(
                    text: " Sigmund,",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),

                  ),
                  TextSpan(
                    text: " Dayana,",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),

                  ),
                  TextSpan(
                    text: " Yassina,",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),

                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: " 1263 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                ],
              ),
            ),
          ),
          // #Caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.userName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " ${post.caption}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ]
              ),
            ),
          ),
          // #Postdate
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text ("March 2021", textAlign: TextAlign.start, style: TextStyle(color: Colors.grey),),
            ),
        ],
      ),
    );
  }
  Widget _itemOfStory (Story story) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.name, style: TextStyle(color: Colors.grey),),
      ],
    );
  }
}
