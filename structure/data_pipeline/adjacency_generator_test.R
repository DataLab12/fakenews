library(igraph)

graphs_path = '/Users/maria/Desktop/twitterAnalysis/FakeNews/dataset/graphs/test_graphs'

for (i in 1:1165){
  edge_path <- paste(graphs_path, '/', i ,'/edges.txt', sep="")
  node_path <- paste(graphs_path, '/', i ,'/nodes.csv', sep="")
  edges <- read.table(edge_path, quote="\"", comment.char="")
  nodes <- read.csv(node_path)
  g <- graph.data.frame(edges, nodes, directed=T)
  adj <- as_adjacency_matrix(g)
  adj <- as.matrix(adj)
  write.csv(adj, file=paste(graphs_path, '/', i, '/adjacency.csv', sep=""))
}
