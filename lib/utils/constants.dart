import 'package:flutter/material.dart';

const kprimaryColor = Color(0xffE31C3D);
const kTextGrey = Color(0xff9FA2B4);
const kBackgroundGrey = Color(0xfff7f8fc);

const smallGreyText = TextStyle(
  color: kTextGrey,
  fontSize: 14,
);

const div = Divider(
  color: Colors.grey,
  thickness: 1,
);
const largeGreyText = TextStyle(
  color: kTextGrey,
  fontSize: 36,
  fontWeight: FontWeight.w700,
);
const mediumGreyText = TextStyle(
  color: kTextGrey,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);
const subTitleText = TextStyle(
  color: kDarkBlueTxtColor,
  fontSize: 16,
  fontWeight: FontWeight.w700,
);
const smallRedText = TextStyle(
  color: kprimaryColor,
  fontSize: 14,
);

const smallGreyTextBold = TextStyle(
  color: kTextGrey,
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

const Color kDarkBlueTxtColor = Color(0xff252733);
const kSBox20V = SizedBox(
  height: 20,
);

const kSBox10V = SizedBox(
  height: 10,
);
const kSBox30V = SizedBox(
  height: 30,
);

const kSBox5V = SizedBox(
  height: 5,
);

const kSBox3V = SizedBox(
  height: 3,
);

const kSBox50V = SizedBox(
  height: 50,
);

const kSBox20H = SizedBox(
  width: 20,
);

Map<int, int> pointsToRuleMap = {
  500: 4403,
  450: 4404,
  400: 4405,
  350: 4406,
  300: 4407,
  250: 4408,
  200: 4409,
  150: 4410,
  100: 4411,
  50: 4412,
};

var data = [
  {
    "id": 59,
    "title": "Anisuma Shopping Vouchers",
    "description":
        "Unlock the latest in technology with Anisuma shopping vouchers. Specializing in top-tier gadgets, home theater systems, sound equipment, and gaming gear, Anisuma provides premium electronics designed to elevate your entertainment, tech, and gaming experiences.",
    "imageUrl": "anisuma.jpg",
    "value": 5000.00,
    "tier": "Tier 1",
    "quantity": 7
  },
  {
    "id": 50,
    "title": "Jaffs Optical",
    "description":
        "Jaffs Optical offers advanced eye care solutions with high-quality eyewear and expert services. Known for their precision and stylish frames, they ensure comfort, durability, and optimal vision for every client. Visit Jaffs for tailored eye care and chic eyewear options to suit your needs.",
    "imageUrl": "jaffs.jpg",
    "value": 10000.00,
    "tier": "Tier 1",
    "quantity": 10
  },
  {
    "id": 44,
    "title": "Ella Anatomic Vouchers",
    "description":
        "Experience the perfect blend of style and comfort at Ella Anatomic Shoes. Specializing in footwear crafted for physiological well-being, their handcrafted designs provide excellent arch support and cushioning, reducing foot fatigue. Ideal for any lifestyle, their collection ensures you stay stylish and comfortable all day.",
    "imageUrl": "ella.jpg",
    "value": 10000.00,
    "tier": "Tier 1",
    "quantity": 6
  },
  {
    "id": 41,
    "title": "Village Market Recreation family pass for 5 pax games only",
    "description":
        "Create fun-filled memories with a family pass for five at Village Market Recreation. Enjoy a variety of exciting games and activities that promise laughter and bonding moments.",
    "imageUrl": "recreation.jpg",
    "value": 10000.00,
    "tier": "Tier 1",
    "quantity": 3
  },
  {
    "id": 37,
    "title": "Ella Anatomic Vouchers",
    "description":
        "Experience the perfect blend of style and comfort at Ella Anatomic Shoes. Specializing in footwear crafted for physiological well-being, their handcrafted designs provide excellent arch support and cushioning, reducing foot fatigue. Ideal for any lifestyle, their collection ensures you stay stylish and comfortable all day.",
    "imageUrl": "ella.jpg",
    "value": 10000.00,
    "tier": "Tier 2",
    "quantity": 4
  },
  {
    "id": 30,
    "title": "Village Market Recreation family pass for 5 pax games only",
    "description":
        "Create fun-filled memories with a family pass for five at Village Market Recreation. Enjoy a variety of exciting games and activities that promise laughter and bonding moments.",
    "imageUrl": "recreation.jpg",
    "value": 10000.00,
    "tier": "Tier 2",
    "quantity": 7
  },
  {
    "id": 29,
    "title": "2 x Kaya Spa voucher - worth KES 5,000",
    "description":
        "Pamper yourself with a rejuvenating spa session at Kaya Spa, a luxurious urban retreat inspired by the mysticism of the Kaya forests. Indulge in premium treatments, tranquil zones, and world-class facilities designed to rejuvenate your body, mind, and spirit. Perfect for ultimate relaxation and self-care.",
    "imageUrl": "kaya.jpg",
    "value": 10000.00,
    "tier": "Tier 2",
    "quantity": 1
  },
  {
    "id": 26,
    "title": "2 x Harvest lunch worth KES 5,000 excl alcohol",
    "description":
        "Enjoy a premium dining experience at Harvest Restaurant. Indulge in a delicious lunch featuring farm-to-table cuisine, crafted to delight your taste buds with fresh and flavorful dishes.",
    "imageUrl": "harvest.jpg",
    "value": 10000.00,
    "tier": "Tier 2",
    "quantity": 1
  },
  {
    "id": 27,
    "title": "2 x Bang Bang Lunch voucher worth KES 5,000 excl alcohol",
    "description":
        "Delight in authentic Thai cuisine at Bang Bang, where every dish is crafted with fresh ingredients and traditional techniques. From fragrant curries to flavorful wok recipes inspired by Grandma Mae's kitchen, enjoy a vibrant dining experience that brings the essence of Thailand to your table.",
    "imageUrl": "bang.jpg",
    "value": 10000.00,
    "tier": "Tier 2",
    "quantity": 1
  },
  {
    "id": 28,
    "title": "2 x Jiko Voucher worth KES 5,000 excl alcohol",
    "description":
        "Discover the rich culinary heritage of Africa with a dining experience at Jiko. Inspired by traditional cooking techniques and ingredients, Jiko offers innovative yet comforting dishes in a vibrant, social setting.",
    "imageUrl": "jiko.jpg",
    "value": 10000.00,
    "tier": "Tier 2",
    "quantity": 1
  },
  {
    "id": 21,
    "title": "One month VMX Gym Membership",
    "description":
        "Get fit and healthy with a one-month membership at VMX Gym. Enjoy state-of-the-art fitness equipment, expert trainers, and a variety of fitness classes to help you reach your health and wellness goals.",
    "imageUrl": "vmx.jpg",
    "value": 15000.00,
    "tier": "Tier 2",
    "quantity": 5
  },
  {
    "id": 59,
    "title": "Anisuma Shopping Vouchers",
    "description":
        "Unlock the latest in technology with Anisuma shopping vouchers. Specializing in top-tier gadgets, home theater systems, sound equipment, and gaming gear, Anisuma provides premium electronics designed to elevate your entertainment, tech, and gaming experiences.",
    "imageUrl": "anisuma.jpg",
    "value": 10000.00,
    "tier": "Tier 3",
    "quantity": 6
  },
  {
    "id": 21,
    "title": "One month VMX Gym Membership",
    "description":
        "Get fit and healthy with a one-month membership at VMX Gym. Enjoy state-of-the-art fitness equipment, expert trainers, and a variety of fitness classes to help you reach your health and wellness goals.",
    "imageUrl": "vmx.jpg",
    "value": 15000.00,
    "tier": "Tier 3",
    "quantity": 5
  },
  {
    "id": 7,
    "title": "One night stay at TS Enaki on B&B",
    "description":
        "Escape for a night at TS Enaki, offering a peaceful retreat with a cozy atmosphere and delightful breakfast. This hotel promises comfort and relaxation, perfect for a rejuvenating stay in Nairobi.",
    "imageUrl": "enaki.jpg",
    "value": 16000.00,
    "tier": "Tier 3",
    "quantity": 1
  },
  {
    "id": 6,
    "title": "One night stay at Trademark Hotel on B&B",
    "description":
        "Treat yourself to a one-night stay at Trademark Hotel, Nairobi, complete with breakfast. Experience top-notch service, modern elegance, and convenient access to Village Market.",
    "imageUrl": "trademark.jpg",
    "value": 18000.00,
    "tier": "Tier 3",
    "quantity": 1
  },
  {
    "id": 4,
    "title": "One night stay at Tribe Hotel on B&B",
    "description":
        "Experience luxury and comfort at Tribe Hotel, Nairobi’s luxury boutique hotel. Enjoy a stylish one-night stay in a modern, art-inspired space with stunning views, complemented by a delicious breakfast. Tribe Hotel is the perfect blend of contemporary elegance and world-class service, providing an unforgettable stay.",
    "imageUrl": "tribe.jpg",
    "value": 40000.00,
    "tier": "Tier 3",
    "quantity": 1
  },
  {
    "id": 3,
    "title": "Trip for 2 to Baobab Beach Resort",
    "description":
        "Discover the ultimate beach getaway at Baobab Beach Resort. With pristine beaches, luxurious amenities, and breathtaking views, this trip for two is the perfect mix of relaxation and adventure on the Kenyan coast.",
    "imageUrl": "boabab.jpg",
    "value": 218000,
    "tier": "Tier 3",
    "quantity": 1
  },
  {
    "id": 2,
    "title": "Trip to Nungwi Dreams",
    "description":
        "Enjoy a tropical escape to Nungwi, Zanzibar, where white sandy beaches meet turquoise waters. This dream vacation offers relaxation, adventure, and the beauty of the Indian Ocean in a beautiful setting for two.",
    "imageUrl": "nungwi.png",
    "value": 490960,
    "tier": "Tier 3",
    "quantity": 1
  },
  {
    "id": 1,
    "title": "Trip for 2 to Santorini, Greece",
    "description":
        "Experience the magic of Santorini with a luxury getaway for two. Explore the island's stunning sunsets, white-washed buildings, and crystal-clear waters, making unforgettable memories in one of the most picturesque destinations in the world.",
    "imageUrl": "santorini.jpg",
    "value": 652193,
    "tier": "Tier 3",
    "quantity": 1
  },
];
