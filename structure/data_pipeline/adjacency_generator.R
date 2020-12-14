library(igraph)

graphs_path = '/Users/maria/Desktop/twitterAnalysis/FakeNews/dataset/graphs'

for (i in 1:270){
  edge_path <- paste(graphs_path ,'/5g_corona_conspiracy/' ,i ,'/edges.txt', sep="")
  node_path <- paste(graphs_path ,'/5g_corona_conspiracy/' ,i ,'/nodes.csv', sep="")
  edges <- read.table(edge_path, quote="\"", comment.char="")
  nodes <- read.csv(node_path)
  g <- graph.data.frame(edges, nodes, directed=T)
  adj <- as_adjacency_matrix(g)
  adj <- as.matrix(adj)
  write.csv(adj, file=paste(graphs_path ,'/5g_corona_conspiracy/' ,i, '/adjacency.csv', sep=""))
}
 
for (i in 1:1660){
  edge_path <- paste(graphs_path ,'/non_conspiracy/' ,i ,'/edges.txt', sep="")
  node_path <- paste(graphs_path ,'/non_conspiracy/' ,i ,'/nodes.csv', sep="")
  edges <- read.table(edge_path, quote="\"", comment.char="")
  nodes <- read.csv(node_path)
  g <- graph.data.frame(edges, nodes, directed=T)
  adj <- as_adjacency_matrix(g)
  adj <- as.matrix(adj)
  write.csv(adj, file=paste(graphs_path ,'/non_conspiracy/' ,i, '/adjacency.csv', sep=""))
}
  
for (i in 1:397){
  edge_path <- paste(graphs_path ,'/other_conspiracy/' ,i ,'/edges.txt', sep="")
  node_path <- paste(graphs_path ,'/other_conspiracy/' ,i ,'/nodes.csv', sep="")
  edges <- read.table(edge_path, quote="\"", comment.char="")
  nodes <- read.csv(node_path)
  g <- graph.data.frame(edges, nodes, directed=T)
  adj <- as_adjacency_matrix(g)
  adj <- as.matrix(adj)
  write.csv(adj, file=paste(graphs_path ,'/other_conspiracy/' ,i, '/adjacency.csv', sep=""))
}
