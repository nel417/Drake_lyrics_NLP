install.packages('tm')
library(tm)

docs <- Corpus(DirSource("/home/nick/Desktop/", pattern = "drake_lyrics.txt", encoding = "UTF-8"))
#preprocessing removing white space

toSpace <- content_transformer(function(x, pattern) {
  return (gsub(pattern, "", x))
})

docs <- tm_map(docs, toSpace, "-")
docs <- tm_map(docs, toSpace, ":")
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, " '")
docs <- tm_map(docs, toSpace, "' ")
docs <- tm_map(docs, toSpace, "/n")
docs <- tm_map(docs, toSpace, " -")
docs <- tm_map(docs, toSpace, "- ")
docs <- tm_map(docs, toSpace, "like")
docs <- tm_map(docs, toSpace, "know")
docs <- tm_map(docs, toSpace, "yeah")
docs <- tm_map(docs, toSpace, "just")
docs <- tm_map(docs, toSpace, "dont")
docs <- tm_map(docs, toSpace, "got")
docs <- tm_map(docs, toSpace, "get")
docs <- tm_map(docs, toSpace, "verse")
docs <- tm_map(docs, toSpace, "chorus")
docs <- tm_map(docs, toSpace, "thats")
docs <- tm_map(docs, toSpace, "now")
docs <- tm_map(docs, toSpace, "Drake")
docs <- tm_map(docs, toSpace, "drake")
docs <- tm_map(docs, toSpace, "...cause")



docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeNumbers)

docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, stripWhitespace)

# inspect(docs)

dtm <- DocumentTermMatrix(docs)

freq <- colSums(as.matrix(dtm))
length(freq)

ord <- order(freq, decreasing = TRUE)
freq[head(ord)]
freq[tail(ord)]

freq[ord]
