import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Terms and Condition"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              Text(
                "1. Acceptance of Terms: By downloading, installing, or using the E-Tapon mobile application ("'the App'"), you agree to comply with these Terms and Conditions. If you do not agree with any part of these terms, please refrain from using the App. \n \n"
                    "2. Intellectual Property: All intellectual property rights, including copyrights, trademarks, and patents associated with the App, its design, logos, and content, are the property of E-Tapon or its licensors. You may not use or reproduce any of these materials without prior written consent from E-Tapon. \n \n"
                    "3. Use of the App: The App is provided for personal and non-commercial use only. You may not modify, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information, software, products, or services obtained from the App. \n \n"
                    "4. Data Privacy: E-Tapon values your privacy and handles your personal data in accordance with applicable privacy laws. By using the App, you consent to the collection, storage, and processing of your personal information as outlined in our Privacy Policy. \n \n"
                    "5. Disclaimer of Warranty: The App is provided on an "'as is'" and "'as available'" basis without warranties of any kind, whether express or implied. E-Tapon does not guarantee the accuracy, reliability, or completeness of any information provided through the App. \n \n"
                    "6. Limitation of Liability: In no event shall E-Tapon or its affiliates be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use of the App, even if E-Tapon has been advised of the possibility of such damages. \n \n"
                    "7. Third-Party Links: The App may contain links to third-party websites or services that are not owned or controlled by E-Tapon. We have no control over, and assume no responsibility for, the content, privacy policies, or practices of any third-party websites or services. You acknowledge and agree that E-Tapon shall not be responsible or liable for any damage or loss caused or alleged to be caused by or in connection with the use of any such content, goods, or services available on or through any such websites or services. \n \n"
                    "8. Modification of Terms: E-Tapon reserves the right to modify or update these Terms and Conditions at any time without prior notice. It is your responsibility to review these terms periodically for any changes. Continued use of the App after the modifications shall constitute your consent to the updated Terms and Conditions. \n \n"
                    "9. Governing Law: These Terms and Conditions shall be governed by and construed in accordance with the laws of the Philippines, specifically in Manila. Any disputes arising under or in connection with these terms shall be subject to the exclusive jurisdiction of the courts located in Manila, Philippines. \n \n",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}