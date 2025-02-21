import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/screens/update_profile.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: AppBar(
          backgroundColor: Colors.white70,
          elevation: 3,
          title: Text(
            "Account",
            style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height - height * 0.16,
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: EdgeInsets.all(width * 0.04),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[700],
                    radius: width * 0.08,
                    child: Text(
                      "JL",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Jonathan Mensah",
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    "0244123456",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: width * 0.035,
                    ),
                  ),
                ],
              ),
            ),

            // First Section
            Expanded(
              flex: 5,
              child: _buildSection([
                _buildListTile(context, "assets/svg/user.svg", "Update profile",
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateProfile()),
                        )),
                _buildDivider(),
                _buildListTile(context, "assets/svg/monitor_phone.svg",
                    "Service Preference"),
                _buildDivider(),
                _buildListTile(context, "assets/svg/clock.svg", "Availability"),
                _buildDivider(),
                _buildListTile(context, "assets/svg/notification_status.svg",
                    "Manage notifications"),
                _buildDivider(),
                _buildListTile(context, "assets/svg/support.svg", "Support"),
              ]),
            ),

            SizedBox(height: height * 0.02),

            // Second Section
            Expanded(
              flex: 4,
              child: _buildSection([
                _buildListTile(
                    context, "assets/svg/lock.svg", "Change Password"),
                _buildDivider(),
                _buildListTile(context, "assets/svg/danger.svg",
                    "Request Account deletion"),
                _buildDivider(),
                _buildListTile(
                  context,
                  "assets/svg/logout.svg",
                  "Logout",
                  iconColor: Color(0xffC53030),
                  textColor: Color(0xffC53030),
                ),
                _buildDivider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/svg/mobile.svg",
                    width: width * 0.06,
                    height: width * 0.06,
                    colorFilter: const ColorFilter.mode(
                        Color(0xFF2D63B4), BlendMode.srcIn),
                  ),
                  title: Text(
                    "App Version",
                    style: TextStyle(
                      fontSize: width * 0.035,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Text(
                    "1.0.0",
                    style: TextStyle(fontSize: width * 0.035),
                  ),
                ),
              ]),
            ),

            SizedBox(height: height * 0.02),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: width,
        height: height * 0.08,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[300]!, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navItem(context, "assets/svg/home.svg", "Home"),
            _navItem(context, "assets/svg/monitor_phone.svg", "Requests"),
            _navItem(context, "assets/svg/user_filled.svg", "Account",
                isSelected: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(List<Widget> children) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context,
    String svgPath,
    String text, {
    Color iconColor = const Color(0xFF2D63B4),
    Color textColor = Colors.black,
    VoidCallback? onTap,
  }) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.06,
      child: ListTile(
        leading: SvgPicture.asset(
          svgPath,
          width: width * 0.06,
          height: width * 0.06,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: width * 0.035,
            color: textColor,
          ),
        ),
        trailing: SvgPicture.asset(
          "assets/svg/arrow_right.svg",
          width: width * 0.05,
          height: width * 0.05,
          colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.005,
        ),
        onTap: onTap, // 🔥 Now supports navigation
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 16,
      endIndent: 16,
      color: Colors.grey[200],
    );
  }

  Widget _navItem(
    BuildContext context,
    String svgPath,
    String label, {
    bool isSelected = false,
  }) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          svgPath,
          width: width * 0.06,
          height: width * 0.06,
          colorFilter: ColorFilter.mode(
            isSelected ? const Color(0xFF214883) : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: width * 0.01),
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.03,
            fontWeight: FontWeight.w500,
            color: isSelected ? const Color(0xFF214883) : Colors.grey,
          ),
        ),
      ],
    );
  }
}
