import 'package:flutter/material.dart';
import 'package:mi2a_project_pertama/pages/page_gambar1.dart';
import 'package:mi2a_project_pertama/pages/page_gambar2.dart';
import 'package:mi2a_project_pertama/pages/page_home_movie.dart';
import 'package:mi2a_project_pertama/pages/page_listview.dart';
import 'package:mi2a_project_pertama/pages/page_maps.dart';
import 'package:mi2a_project_pertama/pages/page_maps_dua.dart';
import 'package:mi2a_project_pertama/pages/page_movie_grid.dart';
import 'package:mi2a_project_pertama/pages/page_row_column.dart';
import 'package:mi2a_project_pertama/pages/page_simple_form.dart';
import 'package:mi2a_project_pertama/pages/page_stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PageMapsDua(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageUtama extends StatelessWidget {
  const PageUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MI 2 A PNP",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),

        ),
        backgroundColor: Colors.deepOrange,
      ),

      drawer: SizedBox(
        width: 250,
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(accountName: Text("Putri Alysia"),
                accountEmail: Text("putrialysia0606@gmailp.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 55,
                  child: Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 65,
                  ),
                ),
              ),

              ListTile(
                title: Text("Photo 1"),
                //on Tap
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PageGambar1()));
                },
              ),

              ListTile(
                title: Text("Photo 2"),
                //on Tap
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PageGambar2()));
                },
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: Container(
            width: double.infinity,//lebih flexibel
            height: double.infinity,
            margin: EdgeInsets.all(20),//atas kanan kiri bawah
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10)//bikin cekungan
            ),
            child: Column(
              children: [

                Text('Selamat Datang di Apps Pertama MI 2A by Putri Alysia',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black

                  ),
                ),
                SizedBox(height: 10,),
                MaterialButton(
                  color: Colors.orange,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PageRowColumn()));//dari class A ke class B
                  },
                  child: Text('Page Row'),
                ),

                //Latihan :  menghubungkan semua page yg ada
                //Page column
                SizedBox(height: 10,),
                MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PageColumn()));//dari class A ke class B
                  },
                  child: Text('Page Column'),
                ),
                //Page Listview
                SizedBox(height: 10,),
                MaterialButton(
                  color: Colors.cyanAccent,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PageListview()));//dari class A ke class B
                  },
                  child: Text('Page Listview'),
                ),
                //Page Stack
                SizedBox(height: 10,),
                MaterialButton(
                  color: Colors.tealAccent,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PageStack()));//dari class A ke class B
                  },
                  child: Text('Page Stack'),
                ),
                //Page Simple Login Form
                SizedBox(height: 10,),
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PageSimpleForm()));//dari class A ke class B
                  },
                  child: Text('Page Simple Form'),
                ),
                //Page Movie Grid
                SizedBox(height: 10,),
                MaterialButton(
                  color: Colors.orange,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PageMovieGrid()));//dari class A ke class B
                  },
                  child: Text('Page Movie Grid'),
                ),
                //Page home movie
                SizedBox(height: 10,),
                MaterialButton(
                  color: Colors.orange,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PageHomeMovie()));//dari class A ke class B
                  },
                  child: Text('Page Home Movie'),
                ),

              ],
            )),
      ),
    );
  }
}



