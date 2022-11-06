import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

// ignore: camel_case_types
class astrolojinedir extends StatefulWidget {
  const astrolojinedir({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _astrolojinedirState createState() => _astrolojinedirState();
}

// ignore: camel_case_types
class _astrolojinedirState extends State<astrolojinedir> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Astroloji nedir?'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/astroloji.jpg'),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: HtmlWidget("&nbsp;&nbsp;&nbsp;"
                  "Günümüzde astrologlar, Güneş'in, Ay'ın ve gezegenlerin insanın yaşamı üzerinde etkileri olduğunu ve buradan hareketle bir kişinin geleceğinin kestirilebileceğini öne sürerler. Bazı dergi ve gazetelerde, aynı burçta doğan herkes için ortak kehanetlerde bulunan yıldız falları yayımlanır.<br><br>&nbsp;&nbsp;&nbsp;Babilliler İÖ 6. yüzyılda gezegenlerin gökyüzündeki hareketini gösteren haritalar yaptılar. Böylece Güneş ve Ay tutulmasının ne zaman olacağını önceden kestirebiliyorlardı. Astroloji Babil'den Eski Yunan'a, oradan da Mısır'a ve Hindistan'a geçti. Daha sonra bütün Asya ve Avrupa'ya yayıldı. İS 1066'da gökyüzünde parlak bir kuyrukluyıldız görünmüş ve bu alışılmadık olay insanları çok korkutmuştu. Bunu yorumlayan astrologlar yakın gelecekte bir kralın öleceğini ve çok önemli olayların yaşanacağını söylediler. Gerçekten de birkaç ay sonra, Hastings Savaşı'nda İngiltere Kralı Harold öldürülünce pek çok kişi bu kehanetin doğru olduğuna inandı. Oysa bugün Halley olarak adlandırılan bu kuyrukluyıldızın her 76 yılda bir Dünya çevresindeki yörüngesinden geçtiğini biliyoruz. Halley, her 75-76 yılda bir dünyaya yaklaşıyor ve çıplak gözle izlenebilir hale geliyor. Fakat, bu anlamlı rastlantıya Carl Gustav Jung \"Senkronizasyon Teorisi\"ne göre \"anlamlı rastlantılar\" adını vermektedir."),
            ),
          ],
        ),
      ),
    );
  }
}
