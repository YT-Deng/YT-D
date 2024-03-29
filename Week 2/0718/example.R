library(rvest)
library(jiebaRD)
library(jiebaR)
library(NLP)
library(tm)
library(tmcn)
library(RColorBrewer)
library(wordcloud)
library(dplyr)
library(ggplot2)
library(knitr)


url<-read_html("https://www.dcard.tw/f/food/p/224587575")


article<-html_nodes(url,".CommentEntry_content_1ATrw1 div , .Post_content_NKEl9d div , .Post_title_2O-1el")
text<-html_text(article)
print(text)
class(text)

cutter=worker()
words<-cutter[(text)]
print(words)
class(words)

words<-gsub("[A-Za-z0-9]","",words)
not<-which(words=="")
words<-words[-not]
print(words)

freq<-table(words)
print(freq)
head(sort(freq, decreasing=T))
wordcloud(names(freq),freq,min.freq=5,max.words=50)

freq_2<-t(t(freq))
print(freq_2)
data<-data.frame(freq_2)
Bar<-ggplot(data=data,aes(x=words,y=Freq,fill=Freq)) +
  geom_bar(stat="identity")
print(Bar)


words_tm<-VCorpus(VectorSource(words))
stopwords<-c(stopwordsCN(),"�ڰڰ�","������")
words_tm<-tm_map(words_tm,removeWords,stopwords)
words_tm<-tm_map(words_tm,removePunctuation)
TDM<-TermDocumentMatrix(words_tm)
inspect(TDM)

TFIDF<-as.matrix(TDM)
v<-sort(rowSums(TFIDF), decreasing = TRUE)
head(v)
d<-data.frame(word=names(v),freq=v)
head(d)
wordcloud(d$word,d$freq,min.v=10,max.word=50,ordered.colors=F, 
          colors=rainbow(length(row.names(TFIDF))))
