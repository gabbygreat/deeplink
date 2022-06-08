import 'package:deeplink/pages/second_page.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';


class FirebaseDynamicLinkService{

  static Future<String> createDynamicLink() async{
    String _linkMessage;

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'Write your uriPrefix here',
      link: Uri.parse('Link you want to parse'),
      androidParameters: AndroidParameters(
        packageName: 'your package name',
        minimumVersion: 125,
      ),
    );

    Uri url;
    
      url = parameters.link;

    _linkMessage = url.toString();
    return _linkMessage;
  }

  static Future<void> initDynamicLink(BuildContext context)async {
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData dynamicLink) async{
        final Uri deepLink = dynamicLink.link;

        var isStory = deepLink.pathSegments.contains('storyData');
        // TODO :Modify Accordingly
        if(isStory){
          String id = deepLink.queryParameters['id'];
          // TODO :Modify Accordingly

          if(deepLink!=null){

  
                    return Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      SecondPage()
                    ));
            
          }else{
            return null;
          }
        }
      }, onError: (OnLinkErrorException e) async{
        print('link error');
      }
    );


    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    try{
      final Uri deepLink = data.link;
      var isStory = deepLink.pathSegments.contains('storyData');
      if(isStory){ // TODO :Modify Accordingly
        String id = deepLink.queryParameters['id']; // TODO :Modify Accordingly

        // TODO : Navigate to your pages accordingly here

        // try{
        //   await firebaseFirestore.collection('Stories').doc(id).get()
        //       .then((snapshot) {
        //     StoryData storyData = StoryData.fromSnapshot(snapshot);
        //
        //     return Navigator.push(context, MaterialPageRoute(builder: (context) =>
        //         StoryPage(story: storyData,)
        //     ));
        //   });
        // }catch(e){
        //   print(e);
        // }
      }
    }catch(e){
      print('No deepLink found');
    }
  }
}