//
//  ExhibitionInfo.swift
//  snp65-project
//
//  Created by Sireethorn on 2/12/2565 BE.
//

import Foundation
struct ExhibitionInfo : Identifiable {
    
    var id : Int
    var exhbtState : String
    var exhbtName : String
    var dateStr : String
    var dateEnd : String
    var timeStr : String
    var timeEnd : String
    var loctName : String
    var loctDetail : String
    var ticket : String
    var exhbtAbout : String
    var exhbtOrgnz : String
    var imgCover : String
    
}

var latestExhbtInfo = [
    ExhibitionInfo(
        id: 0,
        exhbtState: "Open",
        exhbtName: "Anthropocene",
        dateStr: "1 Dec 2022",
        dateEnd: "20 Jan 2023",
        timeStr: "10.00",
        timeEnd: "19.00",
        loctName: "Sanamchandra Art Gallery",
        loctDetail: "Silpakorn University, Sanamchandra",
        ticket: "Free",
        exhbtAbout: "ในโครงการนี้ ข้าพเจ้าสนใจศึกษาความเชื่อเกี่ยวกับพระแม่ธรณี เนื่องจากมีความเกี่ยวข้องกับ ประเด็นทางสิ่งแวดล้อม ซึ่งเป็นสิ่งที่สังคมปัจจุบันให้ความสนใจ อีกทั้งความเชื่อเกี่ยวกับเทวสตรีผู้เป็น ตัวแทนผืนโลกและธรรมชาติยังปรากฏในหลากหลายอารยธรรม",
        exhbtOrgnz: "Silpakorn",
        imgCover: "AnthropoceneCover"),
    
    ExhibitionInfo(
        id: 1,
        exhbtState: "Open",
        exhbtName: "นิราษฎร์",
        dateStr: "20 Dec 2022",
        dateEnd: "31 Jan 2023",
        timeStr: "11.00",
        timeEnd: "20.00",
        loctName: "Sanamchandra Art Gallery",
        loctDetail: "Silpakorn University, Sanamchandra",
        ticket: "Free",
        exhbtAbout: "เมื่อ 12 ปีที่แล้ว ข้าพเจ้าได้ไปอาศัยอยู่บ้านญาติเขตเทเวศร์และถูกห้ามปรามไม่ให้ออกไปเล่นนอก บ้านเนื่องด้วยมีเหตุประท้วงในบริเวณใกล้เคียง ซึ่งข้าพเจ้าในวัย 10 ขวบไม่เข้าใจแม้แต่น้อย จนกระทั่ง วันหนึ่งโทรทัศน์รายงานข่าวการล้อมปราบผู้ชุมนุม",
        exhbtOrgnz: "Silpakorn",
        imgCover: "nirajCover")
   


]

var upComingExhbtInfo = [
    ExhibitionInfo(
        id: 0,
        exhbtState: "Upcoming",
        exhbtName: "Anthropocene",
        dateStr: "30 Jan 2023",
        dateEnd: "23 Feb 2023",
        timeStr: "10.00",
        timeEnd: "19.00",
        loctName: "Sanamchandra Art Gallery",
        loctDetail: "Silpakorn University, Sanamchandra",
        ticket: "Free",
        exhbtAbout: "ในโครงการนี้ ข้าพเจ้าสนใจศึกษาความเชื่อเกี่ยวกับพระแม่ธรณี เนื่องจากมีความเกี่ยวข้องกับ ประเด็นทางสิ่งแวดล้อม ซึ่งเป็นสิ่งที่สังคมปัจจุบันให้ความสนใจ อีกทั้งความเชื่อเกี่ยวกับเทวสตรีผู้เป็น ตัวแทนผืนโลกและธรรมชาติยังปรากฏในหลากหลายอารยธรรม",
        exhbtOrgnz: "Silpakorn",
        imgCover: "AnthropoceneCover"),
    ExhibitionInfo(
        id: 1,
        exhbtState: "Upcoming",
        exhbtName: "นิราษฎร์",
        dateStr: "20 Dec 2022",
        dateEnd: "31 Jan 2023",
        timeStr: "11.00",
        timeEnd: "20.00",
        loctName: "Sanamchandra Art Gallery",
        loctDetail: "Silpakorn University, Sanamchandra",
        ticket: "Free",
        exhbtAbout: "เมื่อ 12 ปีที่แล้ว ข้าพเจ้าได้ไปอาศัยอยู่บ้านญาติเขตเทเวศร์และถูกห้ามปรามไม่ให้ออกไปเล่นนอก บ้านเนื่องด้วยมีเหตุประท้วงในบริเวณใกล้เคียง ซึ่งข้าพเจ้าในวัย 10 ขวบไม่เข้าใจแม้แต่น้อย จนกระทั่ง วันหนึ่งโทรทัศน์รายงานข่าวการล้อมปราบผู้ชุมนุม",
        exhbtOrgnz: "Silpakorn",
        imgCover: "nirajCover")
    
]
