library(tidyverse)
library(dplyr)
library(ggplot2)

TR<-read.csv("C:/users/chris/Desktop/YT-D/Week 1/0711/train.csv")
H1<-read.csv("C:/users/chris/Desktop/YT-D/Week 1/0711/TaipeiHotel_1_Jan.csv")
H2<-read.csv("C:/users/chris/Desktop/YT-D/Week 1/0711/TaipeiHotel_2_Feb.csv")
H3<-read.csv("C:/users/chris/Desktop/YT-D/Week 1/0711/TaipeiHotel_3_Mar.csv")
H4<-read.csv("C:/users/chris/Desktop/YT-D/Week 1/0711/TaipeiHotel_4_Apr.csv")
H5<-read.csv("C:/users/chris/Desktop/YT-D/Week 1/0711/TaipeiHotel_5_May.csv")
H6<-read.csv("C:/users/chris/Desktop/YT-D/Week 1/0711/TaipeiHotel_6_Jun.csv")


TP_TR<-filter(TR,82 < TKT_BEG,TKT_BEG < 106)
TR_Jan<-filter(TP_TR,str_detect(BOARD_DATE,"201801"))
TR_Feb<-filter(TP_TR,str_detect(BOARD_DATE,"201802"))
TR_Mar<-filter(TP_TR,str_detect(BOARD_DATE,"201803"))
TR_Apr<-filter(TP_TR,str_detect(BOARD_DATE,"201804"))
TR_May<-filter(TP_TR,str_detect(BOARD_DATE,"201805"))
TR_Jun<-filter(TP_TR,str_detect(BOARD_DATE,"201806"))

TR_JanO<-select(TR_Jan,out)
TR_JanO_Sum<-sum(TR_JanO)
TR_FebO<-select(TR_Feb,out)
TR_FebO_Sum<-sum(TR_FebO)
TR_MarO<-select(TR_Mar,out)
TR_MarO_Sum<-sum(TR_MarO)
TR_AprO<-select(TR_Apr,out)
TR_AprO_Sum<-sum(TR_AprO)
TR_MayO<-select(TR_May,out)
TR_MayO_Sum<-sum(TR_MayO)
TR_JunO<-select(TR_Jun,out)
TR_JunO_Sum<-sum(TR_JunO)




H1_low<- filter(H1, Average.Room.Rate < 3000)
H1_mid<- filter(H1, Average.Room.Rate > 3000, Average.Room.Rate < 4000)
H1_high<- filter(H1, Average.Room.Rate > 4000)
H2_low<- filter(H2, Average.Room.Rate < 3000)
H2_mid<- filter(H2, Average.Room.Rate > 3000, Average.Room.Rate < 4000)
H2_high<- filter(H2, Average.Room.Rate > 4000)
H3_low<- filter(H3, Average.Room.Rate < 3000)
H3_mid<- filter(H3, Average.Room.Rate > 3000, Average.Room.Rate < 4000)
H3_high<- filter(H3, Average.Room.Rate > 4000)
H4_low<- filter(H4, Average.Room.Rate < 3000)
H4_mid<- filter(H4, Average.Room.Rate > 3000, Average.Room.Rate < 4000)
H4_high<- filter(H4, Average.Room.Rate > 4000)
H5_low<- filter(H5, Average.Room.Rate < 3000)
H5_mid<- filter(H5, Average.Room.Rate > 3000, Average.Room.Rate < 4000)
H5_high<- filter(H5, Average.Room.Rate > 4000)
H6_low<- filter(H6, Average.Room.Rate < 3000)
H6_mid<- filter(H6, Average.Room.Rate > 3000, Average.Room.Rate < 4000)
H6_high<- filter(H6, Average.Room.Rate > 4000)

H1_low_Occ<-select(H1_low,No..of.Rooms.Occupied)
H1_low_num<-sum(H1_low_Occ)
H1_mid_Occ<-select(H1_mid,No..of.Rooms.Occupied)
H1_mid_num<-sum(H1_mid_Occ)
H1_high_Occ<-select(H1_high,No..of.Rooms.Occupied)
H1_high_num<-sum(H1_high_Occ)
H2_low_Occ<-select(H2_low,No..of.Rooms.Occupied)
H2_low_num<-sum(H2_low_Occ)
H2_mid_Occ<-select(H2_mid,No..of.Rooms.Occupied)
H2_mid_num<-sum(H2_mid_Occ)
H2_high_Occ<-select(H2_high,No..of.Rooms.Occupied)
H2_high_num<-sum(H2_high_Occ)
H3_low_Occ<-select(H3_low,No..of.Rooms.Occupied)
H3_low_num<-sum(H3_low_Occ)
H3_mid_Occ<-select(H3_mid,No..of.Rooms.Occupied)
H3_mid_num<-sum(H3_mid_Occ)
H3_high_Occ<-select(H3_high,No..of.Rooms.Occupied)
H3_high_num<-sum(H3_high_Occ)
H4_low_Occ<-select(H4_low,No..of.Rooms.Occupied)
H4_low_num<-sum(H4_low_Occ)
H4_mid_Occ<-select(H4_mid,No..of.Rooms.Occupied)
H4_mid_num<-sum(H4_mid_Occ)
H4_high_Occ<-select(H4_high,No..of.Rooms.Occupied)
H4_high_num<-sum(H4_high_Occ)
H5_low_Occ<-select(H5_low,No..of.Rooms.Occupied)
H5_low_num<-sum(H5_low_Occ)
H5_mid_Occ<-select(H5_mid,No..of.Rooms.Occupied)
H5_mid_num<-sum(H5_mid_Occ)
H5_high_Occ<-select(H5_high,No..of.Rooms.Occupied)
H5_high_num<-sum(H5_high_Occ)
H6_low_Occ<-select(H6_low,No..of.Rooms.Occupied)
H6_low_num<-sum(H6_low_Occ)
H6_mid_Occ<-select(H6_mid,No..of.Rooms.Occupied)
H6_mid_num<-sum(H6_mid_Occ)
H6_high_Occ<-select(H6_high,No..of.Rooms.Occupied)
H6_high_num<-sum(H6_high_Occ)



tourist<-c(TR_JanO_Sum,TR_FebO_Sum,TR_MarO_Sum,TR_AprO_Sum,TR_MayO_Sum,TR_JunO_Sum)
print(tourist)

hotel_low<-c(H1_low_num,H2_low_num,H3_low_num,H4_low_num,H5_low_num,H6_low_num)
hotel_mid<-c(H1_mid_num,H2_mid_num,H3_mid_num,H4_mid_num,H5_mid_num,H6_mid_num)
hotel_high<-c(H1_high_num,H2_high_num,H3_high_num,H4_high_num,H5_high_num,H6_high_num)
print(hotel_low)
print(hotel_mid)
print(hotel_high)

Table<-data.frame(Category=rep(c("passenger(/50)","hotel_low","hotel_mid","hotel_high"),each=6),
                  Month=rep(c("Jan","Feb","Mar","Apr","May","Jun"),4),
                  Population=c(TR_JanO_Sum/50,TR_FebO_Sum/50,TR_MarO_Sum/50,TR_AprO_Sum/50,TR_MayO_Sum/50,TR_JunO_Sum/50,
                         H1_low_num,H2_low_num,H3_low_num,H4_low_num,H5_low_num,H6_low_num,
                         H1_mid_num,H2_mid_num,H3_mid_num,H4_mid_num,H5_mid_num,H6_mid_num,
                         H1_high_num,H2_high_num,H3_high_num,H4_high_num,H5_high_num,H6_high_num))
#因火車旅客數量級過大，故全部同除以50等比例縮減
print(Table)
Table$Category <- factor(Table$Category, levels = c("passenger(/50)","hotel_low","hotel_mid","hotel_high"), ordered = TRUE )
Table$Month <- factor(Table$Month, levels = c("Jan","Feb","Mar","Apr","May","Jun"), ordered = TRUE )

Graph<-ggplot(data=Table,aes(x=Month,y=Population,group=Category))+
  geom_line(aes(color=Category))+
  geom_point(aes(color=Category))

Graph_plus<-Graph+scale_color_manual(values=c("#990000","#33FFFF", "#0000FF","#000066"))
print(Graph_plus)


Rev_low<-sum(select(H1_low,Room.Revenue),select(H2_low,Room.Revenue),
             select(H3_low,Room.Revenue),select(H4_low,Room.Revenue),
             select(H5_low,Room.Revenue),select(H6_low,Room.Revenue))
Rev_mid<-sum(select(H1_mid,Room.Revenue),select(H2_mid,Room.Revenue),
             select(H3_mid,Room.Revenue),select(H4_mid,Room.Revenue),
             select(H5_mid,Room.Revenue),select(H6_mid,Room.Revenue))
Rev_high<-sum(select(H1_high,Room.Revenue),select(H2_high,Room.Revenue),
              select(H3_high,Room.Revenue),select(H4_high,Room.Revenue),
              select(H5_high,Room.Revenue),select(H6_high,Room.Revenue))

Revenue<-data.frame(Category=c("hotel_low","hotel_mid","hotel_high"),
                    Rev=c(Rev_low,Rev_mid,Rev_high))
ggplot(data=Revenue)+
  geom_bar(aes(x=factor(1),
               y=Rev,
               fill=Category),
           stat = "identity")+
  coord_polar("y", start=0)
#酒店檔位收益占比(圓餅)、sigma hotel與passenger比較 旅遊旺季(長條)、hotel平均營收(散布圖)、passenger hotel 人次 收入(地圖)
#火車折扣and中檔hotel