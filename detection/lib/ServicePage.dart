import 'package:flutter/material.dart';
import 'Homepage.dart';

class Calculation {
  List? name;
  late int pos;
  List BotName = [
    "Amaranthus viridis",
    "Basella alba",
    "Piper betle",
    "Hibiscus rosasinensis",
    "Pongamia pinnata",
    "Carissa carandas",
    "Coleus amboinicus",
    "Mentha arvensis",
    "Alpinia galanga",
    "Ocimum tenuiflorum",
    "Azadirachta Indica",
    "",
  ];
  List uses1 = [
    "Arive Dantu contains up to 38% protein by dry weight.The leaves contain lysine, an essential amino acid.",
    "Basale is high in Vitamin A, Vitamin C, iron,and calcium.",
    "Betel is great source of antioxidant that fights oxidative stress by scavenging free radicals.",
    "Hibiscus leaves helps to overcome dryness and dandruff.",
    "The leaves are are digestive, laxative and antihelmintic.",
    "Karanda is rich in iron,vitamin C, vitamins A, calciumand phosphorus.",
    "Mexican Mint is used to improve skin, detoxify the body.",
    "Indian Mint is used as a food seasoner, household remedy, and industrial purposes.",
    "Rasna is a versatile aromatic plant with great medicinal value. It is an undershrub widely distributed in greater parts of India.",
    "Tulsi acts as anti-aging factor and helps to overcome infections.",
    "The antibacterial properties of neem fight acne-causing bacteria, which helps in the treatment and prevention of acne.",
    "",
  ];
  List uses2 = [
    "It is used for the treatment of fever, pain, asthma, diabetes, dysentery, urinary disorders, liver disorders, eye disorders and venereal diseases.",
    "It has been attributed with gastro-protective activity, ulcer healing, anti-inflammatory activity, wound healing activity.",
    "It helps in lowering high blood glucose levels and aids in the management of diabetes mellitus.",
    "It used to treat conditions such as to lower blood pressure ,to relieve dry coughs ,and topically to treat skin afflictions.",
    "They are good for diarrhea, leprosy, dyspepsia and cough.",
    "Leaf decoction is used to treat fever, diarrhea, and earache.",
    "It also defend against cough and cold, ease arthritis pain, relieve stress, and optimize digestion.",
    "It is traditionally used in hypertension and in patients with ischemic heart disease.",
    "It is used for the  treatment of pain, indigestion, gout, cough and general debility.",
    "It can help protect against infection, lower your blood sugar, lower your cholesterol, ease joint pain, and protect your stomach.",
    "Neem leaf is used for leprosy, eye disorders, bloody nose, intestinal worms, stomach upset, loss of appetite, skin ulcers, diseases of the heart and blood vessels.",
    "",
  ];
  List link = [
    "https://en.wikipedia.org/wiki/Amaranthus_viridis",
    "https://en.wikipedia.org/wiki/Basella_alba",
    "https://en.wikipedia.org/wiki/Betel",
    "https://en.wikipedia.org/wiki/Hibiscus",
    "https://en.wikipedia.org/wiki/Millettia_pinnata",
    "https://en.wikipedia.org/wiki/Carissa_carandas",
    "https://en.wikipedia.org/wiki/Coleus_amboinicus",
    "https://en.wikipedia.org/wiki/Mentha_arvensis",
    "https://en.wikipedia.org/wiki/Alpinia_galanga",
    "https://en.wikipedia.org/wiki/Ocimum_tenuiflorum",
    "https://en.wikipedia.org/wiki/Azadirachta_indica",
    ""
  ];
  String Find(List? name) {
    try {
      return (name![0]['label']).toString().substring(2);
    } catch (e) {
      return "Retry";
    }
  }
  
  bool show(List? name){
    if (int.parse((name![0]['label']).toString().substring(0,2)) == 11) {
      return false;
    } else {
      return true;
    }
  }

  String BotanicalName(List? name) {
    List? a = name;
    if (Find(name) != "Retry" &&
        (a![0]['label']).toString().substring(3) != "RETAKE THE IMAGE") {
      pos = int.parse((name![0]['label']).toString().substring(0, 1));
      return BotName[pos];
    } else {
      return "";
    }
  }

  String Uses1(List? name) {
    if (Find(name) != "Retry" &&
        (name![0]['label']).toString().substring(3) != "RETAKE THE IMAGE") {
      return uses1[pos];
    } else {
      return "";
    }
  }

  String Uses2(List? name) {
    if (Find(name) != "Retry" &&
        (name![0]['label']).toString().substring(3) != "RETAKE THE IMAGE") {
      return uses2[pos];
    } else {
      return "";
    }
  }

  String Link(List? name) {
    if (Find(name) != "Retry" &&
        (name![0]['label']).toString().substring(3) != "RETAKE THE IMAGE") {
      return link[pos];
    } else {
      return "";
    }
  }
}
