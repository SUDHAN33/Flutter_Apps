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
    "Brassica Juncea",
    "Ficus Religiosa",
    "Moringa Oleifera",
    "Murraya Koenigii",
    "Nyctanthes Arbor-tristis",
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
    "Mustard greens contain many health-boosting antioxidants like beta carotene, which can protect your skin and lower risk factors of diabetes.",
    "Peepal tree leaves have been traditionally used in the treatment of heart ailments, nose bleeding, diabetes, constipation, fever, jaundice, etc.",
    "Drumstick leaves are rich in antioxidants, such as vitamin C and beta-carotene, which protect us from many chronic oxidative diseases, including heart diseases, diabetes, cancer, and Alzheimer's disease.",
    "Curry leaves are packed with antioxidants that may protect your body by reducing oxidative stress and scavenging free radicals.",
    " Parijat leaves has been used to treat a different kind of fevers, cough, arthritis, worm infestation, etc.",
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
    "The greens are also a great source of several B vitamins, including thiamine (B1,) niacin (B3,) and pyridoxine (B6.) ",
    "The leaf juice of the peepal tree may be helpful for cough, asthma, diarrhoea, ear pain, toothache, haematuria (blood in urine), migraine, scabies, eye troubles, and gastric problems.",
    "These leaves also contain Quercetin (an antioxidant) that helps lower blood pressure.",
    "It may reduce heart disease risk factors and have neuroprotective properties.",
    "The leaves juice is bitter and works as a tonic. The kadha or decoction is excellent for arthritis, constipation, worm infestation.",
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
    "https://en.wikipedia.org/wiki/Brassica_juncea",
    "https://en.wikipedia.org/wiki/Ficus_religiosa",
    "https://en.wikipedia.org/wiki/Moringa_oleifera",
    "https://en.wikipedia.org/wiki/Curry_tree",
    "https://en.wikipedia.org/wiki/Nyctanthes_arbor-tristis",
  ];
  String Find(List? name) {
    try {
      return (name![0]['label']).toString().substring(2);
    } catch (e) {
      return "Retry";
    }
  }

  bool show(List? name){
    if (int.parse((name![0]['label']).toString().substring(0,2)) == 16) {
      return false;
    } else {
      return true;
    }
  }

  String BotanicalName(List? name) {
    List? a = name;
    if (Find(name) != "Retry" &&
        (a![0]['label']).toString().substring(3) != "Retake The Image") {
      pos = int.parse((name![0]['label']).toString().substring(0, 1));
      return BotName[pos];
    } else {
      return "";
    }
  }

  String Uses1(List? name) {
    if (Find(name) != "Retry" &&
        (name![0]['label']).toString().substring(3) != "Retake The Image") {
      return uses1[pos];
    } else {
      return "";
    }
  }

  String Uses2(List? name) {
    if (Find(name) != "Retry" &&
        (name![0]['label']).toString().substring(3) != "Retake The Image") {
      return uses2[pos];
    } else {
      return "";
    }
  }

  String Link(List? name) {
    if (Find(name) != "Retry" &&
        (name![0]['label']).toString().substring(3) != "Retake The Image") {
      return link[pos];
    } else {
      return "";
    }
  }
}
