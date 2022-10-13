import 'package:flutter/material.dart';
import 'Homepage.dart';

class Calculation {
  List? name;
  late int pos;
  List BotName = [
    "Vaccinium sect. Cyanococcus",
    "Citrus × sinensis",
    "Prunus persica",
    "Prunus persica",
    "Capsicum annuum",
    "Capsicum annuum",
    "",
    "Rubus idaeus",
    "Glycine max",
    "Cucurbita",
  ];
  List uses1 = [
    "Maintaining healthy bones and  diabetes.",
    "Protects your cells from damage.",
    "Imporve heart health.",
    "Imporve heart health.",
    "May reduce the risk of cataracts and macular degeneration.",
    "May reduce the risk of cataracts and macular degeneration.",
    "NIL",
    "They provide potassium, essential to heart function, and proven to lower blood pressure.",
    "High in fibre, high in protein.",
    "Enhanced Skin Health.",
  ];
  List uses2 = [
    "Preventing cancer.",
    "Helps your body make collagen, a protein that heals wounds and gives you smoother skin.",
    "Aid digestion.",
    "Aid digestion.",
    "May reduce the likelihood of anaemia.",
    "May reduce the likelihood of anaemia.",
    "NIL",
    "The omega-3 fatty acids in raspberries can help prevent stroke and heart disease.",
    "Low in saturated fat.",
    "Reduced Risk of Depression.",
  ];
  List use = [
    "https://www.medicalnewstoday.com/articles/287710#benefits",
    "https://www.webmd.com/food-recipes/health-benefits-oranges",
    "https://www.healthline.com/nutrition/peach-fruit-benefits",
    "https://www.healthline.com/nutrition/peach-fruit-benefits",
    "https://www.bbcgoodfood.com/howto/guide/top-5-health-benefits-of-peppers",
    "https://www.bbcgoodfood.com/howto/guide/top-5-health-benefits-of-peppers",
    "",
    "https://wb.md/3w3SSYr",
    "https://www.betterhealth.vic.gov.au/health/healthyliving/soybeans",
    "https://www.webmd.com/diet/health-benefits-squash",
  ];
  List rem = [
    "NIL",
    "Important to remove trees that have citrus greening disease.",
    "Compounds available for use on peach and nectarine for bacterial spot include copper, oxytetracycline (Mycoshield and generic equivalents), and syllit+captan; however, repeated applications are typically necessary for even minimal disease control.",
    "NIL",
    "The most effective management strategy is the use of pathogen-free certified seeds. Seed treatment with hot water, soaking seeds for 30 minutes in water pre-heated to 125 F/51 C, is effective in reducing bacterial populations on the surface and inside the seeds.",
    "NIL",
    "NIL",
    "NIL",
    "NIL",
    "A better treatment solution for your squash plants is baking soda. Baking soda is an excellent option for treating powdery mildew.",
  ];
  List reme = [
    "",
    "https://www.frontiersin.org/articles/10.3389/fpls.2018.01976/full",
    "https://bit.ly/3ORMCfb",
    "",
    "https://bit.ly/38SoDvO",
    "",
    "",
    "",
    "",
    "https://bit.ly/3syv12n",
  ];
  String Find(List? name) {
    try {
      return (name![0]['label']).toString().substring(2);
    } catch (e) {
      return "Retry";
    }
  }

  String BotanicalName(List? name) {
    if (Find(name) != "Retry") {
      pos = int.parse((name![0]['label']).toString().substring(0, 1));
      return BotName[pos];
    } else {
      return "";
    }
  }

  String Uses1(List? name) {
    if (Find(name) != "Retry") {
      return uses1[pos];
    } else {
      return "";
    }
  }

  String Uses2(List? name) {
    if (Find(name) != "Retry") {
      return uses2[pos];
    } else {
      return "";
    }
  }

  bool show(List? name) {
    if (int.parse((name![0]['label']).toString().substring(0, 1)) == 6) {
      return false;
    } else {
      return true;
    }
  }

  String Uses(List? name) {
    if (Find(name) != "Retry") {
      return use[pos];
    } else {
      return "";
    }
  }

  String Remed(List? name) {
    if (Find(name) != "Retry") {
      return reme[pos];
    } else {
      return "";
    }
  }

  String Remedy(List? name) {
    if (Find(name) != "Retry") {
      return rem[pos];
    } else {
      return "";
    }
  }
}
