import SwiftUI
import Foundation
let dryFoodBrandFormulas = allBrandFormulas.filter {
    ["ROYAL CANIN KITTEN", "ROYAL CANIN", "Kaniva", "Me-O Gold Selection", "Me-O Gold", "Me-O", "Purina ONE", "WHISKAS JUNIOR", "WHISKAS ADULT 1+", "Buzz Advanced Nutrition", "Buzz Beyond"].contains($0.brand)
}

let wetFoodBrandFormulas = [
    BrandFormula(brand: "Brand C", formula: "Formula 3", calories: 150, imageUrl: "https://example.com/image3"),
    BrandFormula(brand: "Brand D", formula: "Formula 4", calories: 200, imageUrl: "https://example.com/image4")
]

let foods = [
    Food(name: "อาหารแห้ง", brands: ["ROYAL CANIN KITTEN", "ROYAL CANIN", "Kaniva", "Me-O Gold Selection", "Me-O Gold",
                                     "Me-O", "Purina ONE","WHISKAS JUNIOR", "WHISKAS ADULT 1+", "Buzz Advanced Nutrition",
                                    "Buzz Beyond"],
         brandFormulas: dryFoodBrandFormulas),
    
    Food(name: "อาหารเปียก", brands: ["Brand C", "Brand D"], brandFormulas: wetFoodBrandFormulas)
]






let royalCaninKittenBrandFormulas = [BrandFormula(brand: "ROYAL CANIN KITTEN", formula: "แม่แมว และลูกแมว  (MOTHER & BABYCAT)", calories: 432.1, imageUrl:
                                        "https://cdn.royalcanin-weshare-online.io/BOcpdn8BaPOZra8q2dU7/v443/sol-mother-babycat-dry-packshot-b1?w=640&auto=compress"),
                                     BrandFormula(brand: "ROYAL CANIN KITTEN", formula: "ลูกแมว  (KITTEN)", calories: 395.7, imageUrl: "https://cdn.royalcanin-weshare-online.io/Yz-nV30BRYZmsWpcqspy/v669/sol-kitten-dry-packshot-b1?w=640&auto=compress"),
                                     BrandFormula(brand: "ROYAL CANIN KITTEN", formula: "ลูกแมวพันธุ์บริติช ชอร์ตแฮร์  (BRITISH SHORTHAIR KITTEN)", calories: 404.3, imageUrl: "https://cdn.royalcanin-weshare-online.io/eCEqa2QBaxEApS7L2fi7/v426/fbn2016-packshot-british-shorthair-kitten?w=640&auto=compress"),
                                     BrandFormula(brand: "ROYAL CANIN KITTEN", formula: "ลูกแมวพันธุ์เมนคูน  (MAINE COON KITTEN)", calories: 416.5, imageUrl: "https://cdn.royalcanin-weshare-online.io/eSEqa2QBaxEApS7L3PhA/v445/fbn2016-packshot-maine-coon-kitten?w=640&auto=compress"),
                                     BrandFormula(brand: "ROYAL CANIN KITTEN", formula: "ลูกแมวพันธุ์เปอร์เซีย  (PERSIAN KITTEN)", calories: 414.3, imageUrl: "https://cdn.royalcanin-weshare-online.io/CiIermsBaxEApS7LPyBK/v537/fbn2016-packshot-persian-kitten?w=640&auto=compress")
    
    
]

let royalCaninBrandFormulas = [BrandFormula(brand: "ROYAL CANIN KITTEN", formula: "ลูกแมวทำหมัน  (KITTEN STERILISED)", calories: 337.7, imageUrl:
                                    "https://cdn.royalcanin-weshare-online.io/m1ayV30BBKJuub5qT8y3/v456/sol-kitten-ster-dry-packshot-b1?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตพันธุ์เมนคูน  (MAINE COON ADULT)", calories: 396.25, imageUrl: "https://cdn.royalcanin-weshare-online.io/ZmmyrWsBG95Xk-RBR_tR/v465/fbn2016-packshot-maine-coon-adult?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตพันธุ์เปอร์เซีย  (PERSIAN ADULT)", calories: 407.65, imageUrl: "https://cdn.royalcanin-weshare-online.io/Z2mzrWsBG95Xk-RB7vuL/v565/fbn2016-packshot-persian-adult?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตเลี้ยงปล่อย  (FIT)", calories: 373.7, imageUrl: "https://cdn.royalcanin-weshare-online.io/b2m7rWsBG95Xk-RB6Pto/v500/16-fit-32-b1-est?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตเลี้ยงในบ้าน  (INDOOR)", calories: 365.1, imageUrl: "https://cdn.royalcanin-weshare-online.io/9Gkua2QBG95Xk-RBh9KI/v598/16-indoor-27-b1-ne?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวสูงวัยเลี้ยงในบ้าน  (INDOOR 7+)", calories: 364.4, imageUrl: "https://cdn.royalcanin-weshare-online.io/8Gkua2QBG95Xk-RBhtKW/v650/16-indoor-7-b1-in?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตกินยาก  (AROMA EXIGENT)", calories: 377.2, imageUrl: "https://cdn.royalcanin-weshare-online.io/bWm6rWsBG95Xk-RBuvtx/v368/16-aroma-exigent-b1-ne?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตที่ต้องการดูแลระบบย่อย  (SENSIBLE)", calories: 418.15, imageUrl: "https://cdn.royalcanin-weshare-online.io/RSEua2QBaxEApS7Lkftt/v566/16-sensible-33-b1-in?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตกินยาก  (PROTEIN EXIGENT)", calories: 377.9, imageUrl: "https://cdn.royalcanin-weshare-online.io/gGnnrWsBG95Xk-RBi_uj/v188/16-protein-exigent-b1-ne?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตทำหมัน  (STERILISED)", calories: 350.3, imageUrl: "https://cdn.royalcanin-weshare-online.io/_Gkua2QBG95Xk-RBk9IP/v540/16-sterilised-37-b1-ne?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตพันธุ์ แร็กดอลล์  (RAGDOLL ADULT)", calories: 389.75, imageUrl: "https://cdn.royalcanin-weshare-online.io/aGm1rWsBG95Xk-RBZ_tx/v413/fbn2016-packshot-ragdoll?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตพันธุ์บริติช ชอร์ตแฮร์  (BRITISH SHORTHAIR ADULT)", calories: 390.2, imageUrl: "https://cdn.royalcanin-weshare-online.io/ZWmvrWsBG95Xk-RBq_ue/v506/fbn2016-packshot-british-shorthair-adult?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตกินยาก  (SAVOUR EXIGENT)", calories: 382.9, imageUrl: "https://cdn.royalcanin-weshare-online.io/lPkua2QBIYfdNSoCjv5b/v516/16-savour-exigent-b1-in?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตพันธุ์วิเชียรมาศ  (SIAMESE ADULT)", calories: 388.85, imageUrl: "https://cdn.royalcanin-weshare-online.io/amm2rWsBG95Xk-RBkPub/v369/fbn2016-packshot-siamese?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตพันธุ์เบงกอล  (BENGAL ADULT)", calories: 390.8, imageUrl: "https://cdn.royalcanin-weshare-online.io/HGnCt2sBG95Xk-RBu_wq/v408/fbn2016-packshot-bengal?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโตพันธุ์สฟิงซ์  (SPHYNX ADULT)", calories: 411.6, imageUrl: "https://cdn.royalcanin-weshare-online.io/fCEqa2QBaxEApS7L3_g0/v332/fbn2016-packshot-sphynx?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโต ที่ต้องการดูแลสุขภาพทางเดินปัสสาวะ  (URINARY CARE)", calories: 361.95, imageUrl: "https://cdn.royalcanin-weshare-online.io/xVYCqoQBBKJuub5qQfEn/v213/fcn22-urinary-care-dry-packshot-b1?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโต ที่ต้องการดูแลปัญหาก้อนขน  (HAIRBALL CARE)", calories: 364.6, imageUrl: "https://cdn.royalcanin-weshare-online.io/CT_3qYQBRYZmsWpchu3S/v213/fcn22-hairball-care-dry-packshot-b1?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโต ที่ต้องการดูแลผิวหนังและเส้นขน  (HAIR & SKIN CARE)", calories: 406.25, imageUrl: "https://cdn.royalcanin-weshare-online.io/w1bzqYQBBKJuub5qM_Gf/v247/fcn22-hair-skin-dry-packshot-b1?w=640&auto=compress"),
                               BrandFormula(brand: "ROYAL CANIN", formula: "แมวโต ที่ต้องการควบคุมน้ำหนัก  (LIGHT WEIGHT CARE)", calories: 327.7, imageUrl: "https://cdn.royalcanin-weshare-online.io/fj9L4YQBRYZmsWpcbO0A/v81/fcn22-light-weight-care-dry-packshot-b1?w=640&auto=compress")
]

let royalCaninVetBrandFormulas = [
    BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "โรคตับ (HEPATIC)", calories: 404.5, imageUrl: "https://cdn.royalcanin-weshare-online.io/Y2n0AmsBG95Xk-RBK_ic/v395/vhn-gastrointestinal-hepatic-cat-dry-packshot?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "โรคเบาหวาน (DIABETIC)", calories: 357.65, imageUrl: "https://cdn.royalcanin-weshare-online.io/2_rOt2sBIYfdNSoCHR2f/v458/vhn-weight-management-diabetic-cat-dry-packshot?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "ภาวะภูมิแพ้อาหาร (ANALLERGENIC)", calories: 384.05, imageUrl: "https://cdn.royalcanin-weshare-online.io/1_rO8WgBIYfdNSoCXAoI/v373/vhn-dermatology-anallergenic-s-o-cat-packshot-b1?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "โรคทางเดินอาหาร (GASTROINTESTINAL)", calories: 406.6, imageUrl: "https://cdn.royalcanin-weshare-online.io/HmkL_2oBG95Xk-RB1viz/v407/vhn-gastrointestinal-cat-dry-packshot?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "โรคผิวหนัง (SKIN & COAT)", calories: 371.5, imageUrl: "https://cdn.royalcanin-weshare-online.io/RyLx8WgBaxEApS7LYgrN/v236/vhn-dermatology-skin-coat-cat-packshot-b1?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "ภาวะภูมิแพ้อาหาร (HYPOALLERGENIC)", calories: 390.65, imageUrl: "https://cdn.royalcanin-weshare-online.io/2frS8WgBIYfdNSoCCArm/v218/vhn-dermatology-hypoallergenic-s-o-cat-packshot-b1?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "โรคนิ่ว (URINARY S/O)", calories: 404.5, imageUrl: "https://cdn.royalcanin-weshare-online.io/VGnSbmsBG95Xk-RBr_rV/v450/vhn-urinary-urinary-so-cat-dry-packshot?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "โรคทางเดินอาหาร (GASTROINTESTINAL KITTEN)", calories: 426.75, imageUrl: "https://cdn.royalcanin-weshare-online.io/Kmkf_2oBG95Xk-RB__hH/v526/vhn-gastrointestinal-kitten-dry-packshot?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "ลดน้ำหนัก (SATIETY WEIGHT MANAGEMENT)", calories: 292.65, imageUrl: "https://cdn.royalcanin-weshare-online.io/yyLbrGsBaxEApS7LlR8k/v384/vhn-weight-management-satiety-cat-dry-packshot?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "อาหารแมวสูงวัย (MATURE CONSULT CAT)", calories: 341.35, imageUrl: "https://cdn.royalcanin-weshare-online.io/HefF0H8BaPOZra8qi9ZD/v119/vhn-health-management-mature-consult-cat-cat-dry-packshot-b1?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "โรคไตในระยะเริ่มต้น (EARLY RENAL)", calories: 365.9, imageUrl: "https://cdn.royalcanin-weshare-online.io/hVaJiHEBBKJuub5qL2-_/v409/vhn-vital-support-early-renal-cat-dry-packshot?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "ภาวะภูมิแพ้อาหาร (SENSITIVITY CONTROL)", calories: 347.4, imageUrl: "https://cdn.royalcanin-weshare-online.io/2vrW8WgBIYfdNSoCCAp6/v308/vhn-dermatology-sensitivity-control-cat-packshot-b1?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "โรคไต (RENAL SELECT)", calories: 403.4, imageUrl: "https://cdn.royalcanin-weshare-online.io/QueNq3EBaPOZra8qS3Hb/v399/vhn-vital-support-renal-select-cat-dry-packshot?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "แมวโต ทำหมัน (NEUTERED SATIETY BALANCE)", calories: 326.3, imageUrl: "https://cdn.royalcanin-weshare-online.io/Vj9Y0X8BRYZmsWpcideU/v205/vhn-health-management-neutered-satiety-balance-cat-cat-dry-packshot-b1?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "โรคทางเดินอาหาร (GASTROINTESTINAL FIBRE RESPONSE)", calories: 344.75, imageUrl: "https://cdn.royalcanin-weshare-online.io/JGkT_2oBG95Xk-RBg_gb/v505/vhn-gastrointestinal-fibre-response-cat-dry-packshot?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "โรคไต (RENAL)", calories: 378.55, imageUrl: "https://cdn.royalcanin-weshare-online.io/hlaNiHEBBKJuub5qsG_K/v430/vhn-vital-support-renal-cat-dry-packshot?w=640&auto=compress"),
        BrandFormula(brand: "ROYAL CANIN VETERINARY", formula: "แมวโต ไม่ทำหมัน (ADULT)", calories: 345.8, imageUrl: "https://cdn.royalcanin-weshare-online.io/UT9Q0X8BRYZmsWpc-tdU/v165/vhn-health-management-adult-cat-cat-dry-packshot-b1?w=640&auto=compress")
]

let kanivaBrandFormulas = [
    BrandFormula(brand: "Kaniva", formula: "Indoor Salmon", calories: 372.5, imageUrl: "https://cdn1.productnation.co/stg/sites/6/65af64bc1ab53.jpg"),
    BrandFormula(brand: "Kaniva", formula: "Urinary Care", calories: 372.5, imageUrl: "https://cdn1.productnation.co/stg/sites/6/65af65d74ae5a.jpg"),
    BrandFormula(brand: "Kaniva", formula: "Skin & Coat", calories: 372.5, imageUrl: "https://tailybuddy.com/products/9621/Kaniva-Skin-Coat-catfood14.jpg"),
    BrandFormula(brand: "Kaniva", formula: "Growth And Balance", calories: 386, imageUrl: "https://tailybuddy.com/products/9622/LINE_ALBUM_28623_230821_3.jpg"),
    BrandFormula(brand: "Kaniva", formula: "Mother Cat & Kitten", calories: 401, imageUrl: "https://tailybuddy.com/product/9257/kaniva-mother-cat-kitten-cat-food-chicken-salmon-and-rice-recipe-for-mother-catskittens-3-weeks-1-year"),
    BrandFormula(brand: "Kaniva", formula: "INDOOR FORMULA", calories: 372.5, imageUrl: "https://down-th.img.susercontent.com/file/th-11134207-7qul5-lfzkqpzod93i64"),
    BrandFormula(brand: "Kaniva", formula: "Lamb, Tuna & Rice", calories: 372.5, imageUrl: "https://down-th.img.susercontent.com/file/a0d168623f55efb6f61f0794711d9381"),
    BrandFormula(brand: "Kaniva", formula: "Salmon, Tuna & Rice", calories: 372.5, imageUrl: "https://tailybuddy.com/products/8490/salmonTuna9.jpg"),
    BrandFormula(brand: "Kaniva", formula: "Chicken, Tuna & Rice", calories: 372.5, imageUrl: "https://tailybuddy.com/products/8010/kaniva-cat-food-chicken2.jpg")
]


let meoGoldBrandFormulas = [
    BrandFormula(brand: "Me-O Gold Selection", formula: "Kitten ลูกแมว", calories: 356, imageUrl: "https://www.perfectcompanion.com/uploads/stock/e96c62e5-b6c4-4e49-a70e-5417e5aa3a5c.png"),
    BrandFormula(brand: "Me-O Gold Selection", formula: "Indoor Cat แมวเลี้ยงในบ้าน", calories: 321, imageUrl: "https://www.perfectcompanion.com/uploads/stock/2f2ce4dc-9ca1-4996-afe5-8b1c2bdca0d2.png"),
    BrandFormula(brand: "Me-O Gold Selection", formula: "Salmon & Chicken ปลาแซลมอนและไก่", calories: 337, imageUrl: "https://www.perfectcompanion.com/uploads/stock/06eb82ce-3e82-466b-a96d-6b8e366610cf.png"),
    BrandFormula(brand: "Me-O Gold", formula: "Kitten ลูกแมว", calories: 381, imageUrl: "https://www.perfectcompanion.com/uploads/stock/110.png"),
    BrandFormula(brand: "Me-O Gold", formula: "Persian แมวเปอร์เซีย", calories: 358.5, imageUrl: "https://www.perfectcompanion.com/uploads/stock/111.png"),
    BrandFormula(brand: "Me-O Gold", formula: "Fit and Firm ฟิตแอนด์เฟิร์ม", calories: 346, imageUrl: "https://www.perfectcompanion.com/uploads/stock/112.png"),
    BrandFormula(brand: "Me-O Gold", formula: "Indoor Cat แมวเลี้ยงในบ้าน", calories: 347, imageUrl: "https://www.perfectcompanion.com/uploads/stock/113.png")
]


let meoBrandFormulas = [
    
    BrandFormula(brand: "Me-O", formula: "Sterilized Cat แมวทำหมัน", calories: 342.25, imageUrl: "https://www.perfectcompanion.com/uploads/stock/f2bf6f79-537d-41c6-8305-632012d0f0b4.png"),
    BrandFormula(brand: "Me-O", formula: "Ocean Fish ปลาทะเล", calories: 350.5, imageUrl: "https://www.perfectcompanion.com/uploads/stock/114.png"),
    BrandFormula(brand: "Me-O", formula: "Mother and Baby Cat แม่แมวและลูกแมว", calories: 391, imageUrl: "https://www.perfectcompanion.com/uploads/stock/124.png"),
    BrandFormula(brand: "Me-O", formula: "Senior Cat แมวสูงอายุ", calories: 342.5, imageUrl: "https://www.perfectcompanion.com/uploads/stock/130.png"),
    BrandFormula(brand: "Me-O", formula: "Persian เปอร์เซีย", calories: 358.5, imageUrl: "https://www.perfectcompanion.com/uploads/stock/146.png"),
    BrandFormula(brand: "Me-O", formula: "Persian Kitten ลูกแมว เปอร์เซีย", calories: 358.5, imageUrl: "https://www.perfectcompanion.com/uploads/stock/147.png"),
    BrandFormula(brand: "Me-O", formula: "Tuna ปลาทูน่า", calories: 346, imageUrl: "https://www.perfectcompanion.com/uploads/stock/148.png"),
    BrandFormula(brand: "Me-O", formula: "Mackerel ปลาทู", calories: 346, imageUrl: "https://www.perfectcompanion.com/uploads/stock/149.png"),
    BrandFormula(brand: "Me-O", formula: "Seafood ซีฟู้ด", calories: 346, imageUrl: "https://www.perfectcompanion.com/uploads/stock/150.png"),
    BrandFormula(brand: "Me-O", formula: "Gourme โกเม่", calories: 350.5, imageUrl: "https://www.perfectcompanion.com/uploads/stock/151.png"),
    BrandFormula(brand: "Me-O", formula: "Salmon ปลาแซลมอน", calories: 346, imageUrl: "https://www.perfectcompanion.com/uploads/stock/152.png"),
    BrandFormula(brand: "Me-O", formula: "Kitten Ocean Fish ลูกแมว ปลาทะเล", calories: 350.5, imageUrl: "https://www.perfectcompanion.com/uploads/stock/154.png")
]


let purinaOneBrandFormulas = [
    BrandFormula(brand: "Purina ONE", formula: "สูตรลูกแมวทุกสายพันธุ์", calories: 391, imageUrl: "https://www.purina.co.th/sites/default/files/styles/product_380x380/public/2023-09/8850127004823_C1L2_1676608693525_0.jpg?itok=lhR5THWq"),
    BrandFormula(brand: "Purina ONE", formula: "สูตรแมวโต ยูรินารี่ แคร์ เพื่อสุขภาพไต และทางเดินปัสสาวะ", calories: 371, imageUrl: "https://www.purina.co.th/sites/default/files/styles/product_380x380/public/2023-09/8850126001816_C1L2_1677724581637_0.jpg?itok=xWRY6w4U"),
    BrandFormula(brand: "Purina ONE", formula: "สูตรไก่", calories: 354, imageUrl: "https://www.purina.co.th/sites/default/files/styles/product_380x380/public/2023-09/8850127004847_C1L2_1677750376678_0.jpg?itok=LqFICHCw"),
    BrandFormula(brand: "Purina ONE", formula: "สูตรแมวโต พร้อมปลาแซลมอน และทูน่า", calories: 369, imageUrl: "https://www.purina.co.th/sites/default/files/styles/product_380x380/public/2023-09/8850125001671_C1L2_1676609904352_0.jpg?itok=OHAX85aG"),
    BrandFormula(brand: "Purina ONE", formula: "สูตรแมวโต สูตรควบคุม ก้อนขน", calories: 361, imageUrl: "https://www.purina.co.th/sites/default/files/styles/product_380x380/public/2023-09/8850011067019_C1L2_1678161247108_1080_0.jpeg?itok=KOTiv3Ko")
]

let whiskasJuniorBrandFormulas = [
    BrandFormula(brand: "WHISKAS JUNIOR", formula: "MACKEREL ปลาทู พร้อมพ็อกเก็ตรสนม", calories: 350.5, imageUrl: "https://cdn.onemars.net/sites/whiskas_th_208_2/image/large_kitten_mackerel_1-1kg_cmyk_1634305790550.png"),
    BrandFormula(brand: "WHISKAS JUNIOR", formula: "OCEAN FISH ปลาทะเล พร้อมพ็อกเก็ตรสนม", calories: 350.5, imageUrl: "https://cdn.onemars.net/sites/whiskas_th_r81SA_mwh5/image/kitten_oceanfish_1-1kg_cmyk-1_1652270110750.png")
]


let whiskasAdultBrandFormulas = [
    BrandFormula(brand: "WHISKAS ADULT 1+", formula: "WHISKAS INDOOR แมวโตเลี้ยงในบ้าน", calories: 335.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/81/88/8853301143981/thumbnail/8853301143981_9-20230710122346-.jpg"),
    BrandFormula(brand: "WHISKAS ADULT 1+", formula: "WHISKAS SKIN & COAT เพื่อสุขภาพขนและผิวหนังที่ดี รสไก่และปลาแซลมอน", calories: 340.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/39/88/8853301005739/thumbnail/8853301005739_9-20230710122230-.jpg"),
    BrandFormula(brand: "WHISKAS ADULT 1+", formula: "WHISKAS HAIRBALL CONTROL ควบคุมก้อนขน ไก่และปลาทูน่า", calories: 335.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/14/88/8853301400114/thumbnail/8853301400114_9-20230710121119-.jpg"),
    BrandFormula(brand: "WHISKAS ADULT 1+", formula: "MACKEREL ปลาทู", calories: 335.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/52/88/8853301140652/thumbnail/8853301140652_2-20240304141913-.jpg"),
    BrandFormula(brand: "WHISKAS ADULT 1+", formula: "TUNA ปลาทูน่า", calories: 335.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/00/93/9310022866500/thumbnail/9310022866500_9-20230710123539-.jpg"),
    BrandFormula(brand: "WHISKAS ADULT 1+", formula: "OCEAN FISH ปลาทะเล", calories: 335.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/07/88/8853301400107/thumbnail/8853301400107_9-20230710122526-.jpg"),
    BrandFormula(brand: "WHISKAS ADULT 1+", formula: "GRILLED SABA ปลาซาบะย่าง", calories: 335.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/76/88/8853301145176/thumbnail/8853301145176_9-20230710123134-.jpg"),
    BrandFormula(brand: "WHISKAS ADULT 1+", formula: "GOURMET SEAFOOD โกเม่ ซีฟู้ด", calories: 335.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/57/88/8853301141857/thumbnail/8853301141857_9-20230710121408-.jpg"),
    BrandFormula(brand: "WHISKAS ADULT 1+", formula: "GRILLED STEAK SALMON สเต๊กปลาแซลมอนย่าง", calories: 335.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/33/93/9334214022833/thumbnail/9334214022833_9-20230710115939-.jpg"),
    BrandFormula(brand: "WHISKAS ADULT 1+", formula: "CHICKEN ไก่", calories: 335.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/16/88/8853301144216/thumbnail/8853301144216_9-20230710122012-.jpg"),
    BrandFormula(brand: "WHISKAS ADULT 7+", formula: "MACKEREL ปลาทู", calories: 340.5, imageUrl: "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/31/88/8853301000031/thumbnail/8853301000031_9-20230710121921-.jpg")
]

let buzzAdBrandFormulas = [
    BrandFormula(brand: "Buzz Advanced Nutrition", formula: "Weight+ แมวโต เพิ่มน้ำหนัก", calories: 377.5, imageUrl: "https://www.buzzpetsfood.com/wp-content/uploads/2020/05/03_C-weight-1.png"),
    BrandFormula(brand: "Buzz Advanced Nutrition", formula: "Indoor แมวโต เลี้ยงในบ้าน ลดกลิ่นมูล", calories: 359.25, imageUrl: "https://www.buzzpetsfood.com/wp-content/uploads/2020/05/02_C-indoor-1.png"),
    BrandFormula(brand: "Buzz Advanced Nutrition", formula: "Hair & Skin แมวโต บำรุงเส้นขน เเละ ผิวหนัง", calories: 372.75, imageUrl: "https://www.buzzpetsfood.com/wp-content/uploads/2020/05/01_C-hair-skin-1.png"),
    BrandFormula(brand: "Buzz Advanced Nutrition", formula: "Kitten & Pregnant ลูกแมว และ แม่เเมวตั้งท้อง", calories: 404.5, imageUrl: "https://www.buzzpetsfood.com/wp-content/uploads/2020/05/04_C-kitten-1.png")
    
]

let buzzBeyondFormulas = [BrandFormula(brand: "Buzz Beyond", formula: "Salmon Flavor แมวโต รสปลาแซลมอน", calories: 356.25, imageUrl: "https://www.buzzpetsfood.com/wp-content/uploads/2024/05/PKG2024-mockup-Cat_20Beyond-Salmon-1kg.png"),
                          BrandFormula(brand: "Buzz Beyond", formula: "Lamb Flavor แมวโต รสเนื้อแกะ", calories: 356.25, imageUrl: "https://www.buzzpetsfood.com/wp-content/uploads/2024/05/PKG2024-mockup-Cat_20Beyond-Lamb-1kg.png"),
                          BrandFormula(brand: "Buzz Beyond", formula: "Tuna Flavor แมวโต รสปลาทูน่า", calories: 356.25, imageUrl: "https://www.buzzpetsfood.com/wp-content/uploads/2024/05/PKG2024-mockup-Cat_20Beyond-Tuna-1kg.png"),
                          BrandFormula(brand: "Buzz Beyond", formula: "Mackerel Flavor แมวโต รสปลาทู", calories: 356.25, imageUrl: "https://www.buzzpetsfood.com/wp-content/uploads/2024/05/PKG2024-mockup-Cat_20Beyond-Mackerel-1kg.png"),
                          BrandFormula(brand: "Buzz Beyond", formula: "Tuna, Salmon & Milk แม่และลูกแมว รสปลาแซลมอน ทูน่าและนม", calories: 366.25, imageUrl: "https://www.buzzpetsfood.com/wp-content/uploads/2024/05/PKG2024-mockup-Kitten_20Beyond-SalmonTunaMilk-1kg.png")
]

let allBrandFormulas = royalCaninKittenBrandFormulas + royalCaninBrandFormulas + kanivaBrandFormulas + meoGoldBrandFormulas + meoBrandFormulas + purinaOneBrandFormulas + whiskasJuniorBrandFormulas
+ whiskasAdultBrandFormulas + buzzAdBrandFormulas + buzzBeyondFormulas








struct Food: Hashable {
    let name: String
    let brands: [String]
    let brandFormulas: [BrandFormula]
}

struct BrandFormula: Hashable {
    let brand: String
    let formula: String
    let calories: Double
    let imageUrl: String
}

