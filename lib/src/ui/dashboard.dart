import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final f = DateFormat('EEEE, d MMM yyyy', 'id_ID');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromRGBO(246, 245, 251, 1),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                )),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Assalamu\'alaikum,',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: const Icon(Icons.notifications))
                    ],
                  ),
                  const Text(
                    'Ardith.',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    f.format(DateTime.now()),
                    style: const TextStyle(
                        color: Color.fromRGBO(118, 230, 182, 1.0)),
                  ),
                  const SizedBox(height: 47),
                  const WaktuShalatWidget()
                ],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GridView.count(
                primary: false,
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height / 2.5, 20, 20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: <Widget>[
                  MenuItemDashboard(
                      title: 'Produk',
                      subtitle: '34 Total',
                      icon: CupertinoIcons.rocket_fill,
                      iconColor: Color.fromRGBO(106, 88, 255, 1),
                      page: Container(),
                      backgroundIconColor: Color.fromRGBO(228, 230, 255, 1)),
                  MenuItemDashboard(
                      title: 'Mesin Cari',
                      subtitle: 'Cari produk (Google)',
                      icon: Icons.search,
                      iconColor: Color.fromRGBO(32, 178, 178, 1),
                      page: Container(),
                      backgroundIconColor: Color.fromRGBO(224, 244, 243, 1)),
                  MenuItemDashboard(
                      title: 'Transaksi',
                      subtitle: 'Pengeluaran & Pemasukan',
                      icon: Icons.list_alt,
                      iconColor: Color.fromRGBO(44, 156, 219, 1),
                      page: Container(),
                      backgroundIconColor: Color.fromRGBO(207, 233, 248, 1)),
                  MenuItemDashboard(
                      title: 'Profil Saya',
                      subtitle: 'Kelola Akun',
                      icon: Icons.person,
                      iconColor: Color.fromRGBO(106, 88, 255, 1),
                      page: Container(),
                      backgroundIconColor: Color.fromRGBO(239, 238, 254, 1)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return const Color.fromRGBO(152, 226, 194, 1.0);
                        }
                        return const Color.fromRGBO(118, 230, 182, 1.0);
                      }),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  onPressed: () {
                    // String username = _controllerEmailAddress.text.trim();
                    // String password = _controllerPassword.text.trim();
                    // _loginBloc
                    //     .add(LoginEvent(LoginBody(username, password)));
                  },
                  child: Text(
                    'TAMBAH PRODUK',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MenuItemDashboard extends StatelessWidget {
  const MenuItemDashboard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.backgroundIconColor,
    required this.iconColor,
    required this.page,
  }) : super(key: key);

  final String title, subtitle;
  final IconData icon;
  final Color backgroundIconColor, iconColor;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: backgroundIconColor,
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(height: 12.0),
          Text(title, style: const TextStyle(fontSize: 19)),
          const SizedBox(height: 5.0),
          Text(subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }
}

class WaktuShalatWidget extends StatelessWidget {
  const WaktuShalatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('12.06',
                style: TextStyle(
                    color: Color.fromRGBO(118, 230, 182, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Text('Dzuhur', style: TextStyle(color: Colors.white)),
          ],
        ),
        // const VerticalDivider(
        //     width: 1,
        //     indent: 10,
        //     endIndent: 10,
        //     color: Colors.white
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('15.24',
                style: TextStyle(
                    color: Color.fromRGBO(118, 230, 182, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Text('Ashar', style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('18.20',
                style: TextStyle(
                    color: Color.fromRGBO(118, 230, 182, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Text('Maghrib', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
