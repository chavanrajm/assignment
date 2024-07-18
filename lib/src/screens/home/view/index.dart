import 'package:assignment/src/components/appBar.dart';
import 'package:assignment/src/constants/colors.dart';
import 'package:assignment/src/providers/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PostProvider>(context, listen: false).getPosts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          title: Text('My News',
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(Icons.navigation, color: Colors.white,size: 15,),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text('IN',
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
              ),
            )
          ],
          backgroundColor: AppColors.primaryBlue
      ),
      body:  provider.isLoading?Center(child: CircularProgressIndicator(color: AppColors.primaryBlue,),):Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                Text('Top Headlines',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: provider.posts.length,
                itemBuilder: (context, i){
              return Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(

                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(provider.posts[i]['source']['name'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(provider.posts[i]['title'],
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                              Text(DateFormat('dd-MM-yy hh:mm a').format(DateTime.parse(provider.posts[i]['publishedAt'])),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],),
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                          child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),

                              child: Image.network(provider.posts[i]['urlToImage'],
                                fit:BoxFit.cover,
                                frameBuilder: (c, w,i,b){
                                return w;
                                },
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
