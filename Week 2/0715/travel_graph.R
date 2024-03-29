library(tidyverse)
library(dplyr)
library(ggplot2)

TR<-read.csv("C:/users/chris/Documents/GitHub/YT-D/Week 1/0711/train.csv")
H1<-read.csv("C:/users/chris/Documents/GitHub/YT-D/Week 1/0711/TaipeiHotel_1_Jan.csv")
H2<-read.csv("C:/users/chris/Documents/GitHub/YT-D/Week 1/0711/TaipeiHotel_2_Feb.csv")
H3<-read.csv("C:/users/chris/Documents/GitHub/YT-D/Week 1/0711/TaipeiHotel_3_Mar.csv")
H4<-read.csv("C:/users/chris/Documents/GitHub/YT-D/Week 1/0711/TaipeiHotel_4_Apr.csv")
H5<-read.csv("C:/users/chris/Documents/GitHub/YT-D/Week 1/0711/TaipeiHotel_5_May.csv")
H6<-read.csv("C:/users/chris/Documents/GitHub/YT-D/Week 1/0711/TaipeiHotel_6_Jun.csv")


TR_TP<-filter(TR,82 < TKT_BEG & TKT_BEG < 106)
mon=substring(TR_TP$BOARD_DATE,first = 1,last = 6)
TR_TP_M<-mutate(TR_TP,Month=mon)
print(TR_TP_M)
TR_Fin<-group_by(TR_TP_M,Month)%>%
  summarise(out_sum=sum(out))
print(TR_Fin)
TR_Fin_half<-filter(TR_Fin,Month<=201806)
print(TR_Fin_half$out_sum)




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

H1_low_num<-sum(select(H1_low,No..of.Rooms.Occupied))
H1_mid_num<-sum(select(H1_mid,No..of.Rooms.Occupied))
H1_high_num<-sum(select(H1_high,No..of.Rooms.Occupied))
H2_low_num<-sum(select(H2_low,No..of.Rooms.Occupied))
H2_mid_num<-sum(select(H2_mid,No..of.Rooms.Occupied))
H2_high_num<-sum(select(H2_high,No..of.Rooms.Occupied))
H3_low_num<-sum(select(H3_low,No..of.Rooms.Occupied))
H3_mid_num<-sum(select(H3_mid,No..of.Rooms.Occupied))
H3_high_num<-sum(select(H3_high,No..of.Rooms.Occupied))
H4_low_num<-sum(select(H4_low,No..of.Rooms.Occupied))
H4_mid_num<-sum(select(H4_mid,No..of.Rooms.Occupied))
H4_high_num<-sum(select(H4_high,No..of.Rooms.Occupied))
H5_low_num<-sum(select(H5_low,No..of.Rooms.Occupied))
H5_mid_num<-sum(select(H5_mid,No..of.Rooms.Occupied))
H5_high_num<-sum(select(H5_high,No..of.Rooms.Occupied))
H6_low_num<-sum(select(H6_low,No..of.Rooms.Occupied))
H6_mid_num<-sum(select(H6_mid,No..of.Rooms.Occupied))
H6_high_num<-sum(select(H6_high,No..of.Rooms.Occupied))




hotel_low<-c(H1_low_num,H2_low_num,H3_low_num,H4_low_num,H5_low_num,H6_low_num)
hotel_mid<-c(H1_mid_num,H2_mid_num,H3_mid_num,H4_mid_num,H5_mid_num,H6_mid_num)
hotel_high<-c(H1_high_num,H2_high_num,H3_high_num,H4_high_num,H5_high_num,H6_high_num)
print(hotel_low)
print(hotel_mid)
print(hotel_high)

pass_out=TR_Fin_half$out_sum/50
print(c(pass_out))
print(c(pass_out,
  H1_low_num,H2_low_num,H3_low_num,H4_low_num,H5_low_num,H6_low_num,
  H1_mid_num,H2_mid_num,H3_mid_num,H4_mid_num,H5_mid_num,H6_mid_num,
  H1_high_num,H2_high_num,H3_high_num,H4_high_num,H5_high_num,H6_high_num))

Table<-data.frame(Category=rep(c("passenger(/50)","hotel_low","hotel_mid","hotel_high"),each=6),
                  Month=rep(c("Jan","Feb","Mar","Apr","May","Jun"),4),
                  Population=c(pass_out,
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
#各級價位旅館住客數量與火車乘客數量比較

Rev_low<-sum(select(H1_low,Room.Revenue),select(H2_low,Room.Revenue),
             select(H3_low,Room.Revenue),select(H4_low,Room.Revenue),
             select(H5_low,Room.Revenue),select(H6_low,Room.Revenue))
Rev_mid<-sum(select(H1_mid,Room.Revenue),select(H2_mid,Room.Revenue),
             select(H3_mid,Room.Revenue),select(H4_mid,Room.Revenue),
             select(H5_mid,Room.Revenue),select(H6_mid,Room.Revenue))
Rev_high<-sum(select(H1_high,Room.Revenue),select(H2_high,Room.Revenue),
              select(H3_high,Room.Revenue),select(H4_high,Room.Revenue),
              select(H5_high,Room.Revenue),select(H6_high,Room.Revenue))

Rev=c(Rev_low,Rev_mid,Rev_high)
Category=c("hotel_low","hotel_mid","hotel_high")
Revenue<-data.frame(Category=c("hotel_low","hotel_mid","hotel_high"),
                    Rev=c(Rev_low,Rev_mid,Rev_high))
print(Rev)
Reve=cumsum(Rev)
midpoint = Reve - Rev/2

lab = paste0(Category, " ", round(Rev/sum(Rev) * 100, 1), "%")


ggplot(Revenue,aes(x="",y=Rev,fill=Category))+
  geom_bar(stat = "identity")+
  coord_polar("y", start=0)+
  geom_text(aes(x = 1, y = midpoint, label = lab))
#酒店檔位收益占比(圓餅)

sum1_hotel<-sum(select(H1,No..of.Rooms.Occupied))
print(sum1_hotel)
sum2_hotel<-sum(select(H2,No..of.Rooms.Occupied))
sum3_hotel<-sum(select(H3,No..of.Rooms.Occupied))
sum4_hotel<-sum(select(H4,No..of.Rooms.Occupied))
sum5_hotel<-sum(select(H5,No..of.Rooms.Occupied))
sum6_hotel<-sum(select(H6,No..of.Rooms.Occupied))
sum_hotel<-c(sum1_hotel,sum2_hotel,sum3_hotel,sum4_hotel,sum5_hotel,sum6_hotel)

pass_out2=TR_Fin_half$out_sum/25

Bar<-data.frame(Month=factor(rep(c("Jan","Feb","Mar","Apr","May","Jun"),2),
                             levels = c("Jan","Feb","Mar","Apr","May","Jun")),
                Popu=c(sum_hotel,pass_out2),
                Gro=factor(rep(c("hotel","train"),each=6)))

print(Bar)

Bar_ch1<-ggplot(data=Bar,aes(x=Month,y=Popu,fill=Gro)) +
  geom_bar(stat = "identity",position="stack")
print(Bar_ch1)

Bar_ch2<-ggplot(data=Bar,aes(x=Month,y=Popu,fill=Gro)) +
  geom_bar(stat = "identity",position="dodge")
print(Bar_ch2)


#sum(hotel)與passenger比較->旅遊旺季(長條)
#hotel平均營收(散布圖)
#passenger,hotel人次、收入(地圖)
#火車折扣and中檔hotel
#火車除以旅館
#density curve
#in+out=總流量
#locater()
