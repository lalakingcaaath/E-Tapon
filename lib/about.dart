import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset('images/cleancity.png'),
            const Text(
              "E-Tapon is a cutting-edge smart trash bin monitoring system "
                  "designed to revolutionize waste management. With its "
                  "intuitive mobile application, E-Tapon provides timely "
                  "updates and control over your trash bins, ensuring "
                  "efficient waste segregation and monitoring. The app "
                  "seamlessly connects with the E-Tapon hardware system, "
                  "enabling users to monitor the status of their trash "
                  "bins remotely.E-Tapon is a cutting-edge smart trash bin "
                  "monitoring system designed to revolutionize waste "
                  "management. With its intuitive mobile application, "
                  "E-Tapon provides real-time updates and control over "
                  "your trash bins, ensuring efficient waste segregation "
                  "and monitoring. The app seamlessly connects with the "
                  "E-Tapon hardware system, enabling users to monitor the "
                  "status of their trash bins remotely.",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Meet the team!",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Frederick Vigilia",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Developer/Researcher",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Jericho Pio",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Developer/Researcher",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Mary Joyce Sumagang",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Researcher",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Honeygift Ney",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Researcher",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("John Rovick Perlas",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Researcher",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Raymond Domanico",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Researcher",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ],
          ),
        ),
      ),
    );
  }
}
