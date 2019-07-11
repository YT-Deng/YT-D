library(dplyr)

A<-read.csv("C:/users/chris/desktop/data/train01.csv")
B<-read.csv("C:/users/chris/desktop/data/hotel.csv")
head(A)
head(B)

filter(A,out > 1000)
filter(A,enter > 1000)
filter(A,enter+out > 10000)
filter(A,TKT_BEG > 100)

select(B,Hotel.Name,Average.Room.Rate)
filter(B,Average.Room.Rate > 3000)
#???Error
filter(B,Total.Revenue > 10000000)

