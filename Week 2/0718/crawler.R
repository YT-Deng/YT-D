library("rvest")

url<-read_html("https://www.dcard.tw/search?forum=food&query=%E6%B3%A1%E9%BA%B5&sort=relevance")

title<-html_nodes(url,".PostEntry_excerpt_2eHlNn , .kbMFFv")
html_text(title)

link<-html_nodes(url,".PostEntry_root_V6g0rd")
html_attr(link,"href")