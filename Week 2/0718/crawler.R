library("rvest")

url<-read_html("https://www.dcard.tw/search?forum=food&query=%E6%B3%A1%E9%BA%B5&sort=relevance")

title<-html_nodes(url,".PostEntry_excerpt_2eHlNn , .kbMFFv")
html_text(title)

link<-html_nodes(url,".PostEntry_root_V6g0rd")
link_2<-html_attr(link,"href")
print(link_2)
n<-length(link_2)

for (i in c(1:n)){
  article<-html_nodes("link_2[i]",".CommentEntry_content_1ATrw1 div , .Post_content_NKEl9d div , .Post_title_2O-1el")
  i<-i+1
}

text<-html_text(article)
print(text)