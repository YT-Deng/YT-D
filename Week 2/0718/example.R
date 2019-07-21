library("rvest")
library("jiebaRD")
library("jiebaR")
library("NLP")
library("tm")
library("tmcn")
library("RColorBrewer")
library("wordcloud")
library("dplyr")
library("ggplot2")


url<-read_html("https://www.dcard.tw/f/food/p/224587575")


article<-html_nodes(url,".CommentEntry_content_1ATrw1 div , .Post_content_NKEl9d div , .Post_title_2O-1el")
text<-html_text(article)
print(text)

cutter=worker()
words<-cutter[(text)]
print(words)

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
stopwords<-c(stopwordsCN(),"°Ú°Ú°Ú","«¢«¢«¢")
words_tm<-tm_map(words_tm,removeWords,stopwords)
words_tm<-tm_map(words_tm,removePunctuation)

TDM<-TermDocumentMatrix(words_tm)
inspect(TDM)

TFIDF<-as.matrix(TDM)