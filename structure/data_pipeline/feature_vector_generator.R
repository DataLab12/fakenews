library(igraph)

graphs_path = '/Users/maria/Desktop/twitterAnalysis/FakeNews/dataset/graphs'

feature_df_5g_corona_conspiracy <- data.frame("n_nodes" = numeric(0), 
                                              "n_edges" = numeric(0), 
                                              "diameter" = numeric(0), 
                                              "mean_distance" = numeric(0), 
                                              "edge_density" = numeric(0),
                                              "reciprocity" = numeric(0), 
                                              "transitivity_global" = numeric(0), 
                                              "transitivity_localaverage" = numeric(0),
                                              "triangles" = numeric(0), 
                                              "mean_in_degree" = numeric(0), 
                                              "max_in_degree" = numeric(0), 
                                              "min_in_degree" = numeric(0), 
                                              "mean_out_degree" = numeric(0), 
                                              "max_out_degree" = numeric(0), 
                                              "min_out_degree" = numeric(0),
                                              "mean_total_degree" = numeric(0), 
                                              "max_total_degree" = numeric(0), 
                                              "min_total_degree" = numeric(0))
for (i in 1:270){
  # Import graph data
  
  edge_path <- paste(graphs_path ,'/5g_corona_conspiracy/' ,i ,'/edges.txt', sep="")
  node_path <- paste(graphs_path ,'/5g_corona_conspiracy/' ,i ,'/nodes.csv', sep="")
  edges <- read.table(edge_path, quote="\"", comment.char="")
  nodes <- read.csv(node_path)
  g <- graph.data.frame(edges, nodes, directed=T)
  
  # Extract features
  
  n_nodes <- vcount(g)
  n_edges <- ecount(g)
  diameter <- diameter(g, directed=TRUE, weights=NA)
  mean_distance <- mean_distance(g, directed=TRUE)
  edge_density <- edge_density(g)
  reciprocity <- reciprocity(g)
  transitivity_global <- transitivity(g, type="global")
  transitivity_localaverage <- transitivity(g, type="localaverage")
  triangles <- sum(count_triangles(g))/3
  mean_in_degree <- mean(degree(g, mode="in"))
  max_in_degree <- max(degree(g, mode="in"))
  min_in_degree <- min(degree(g, mode="in"))
  mean_out_degree <- mean(degree(g, mode="out"))
  max_out_degree <- max(degree(g, mode="out"))
  min_out_degree <- min(degree(g, mode="out"))
  mean_total_degree <- mean(degree(g, mode="total"))
  max_total_degree <- max(degree(g, mode="total"))
  min_total_degree <- min(degree(g, mode="total"))
  
  # Write features to CSV
  
  feature_vector <- c(n_nodes, n_edges, diameter, mean_distance, edge_density,
                      reciprocity, transitivity_global, transitivity_localaverage,
                      triangles, mean_in_degree, max_in_degree, min_in_degree, 
                      mean_out_degree, max_out_degree, min_out_degree,
                      mean_total_degree, max_total_degree, min_total_degree)
  feature_df_5g_corona_conspiracy[nrow(feature_df_5g_corona_conspiracy) + 1,] <- feature_vector
}

feature_df_non_conspiracy <- data.frame("n_nodes" = numeric(0), 
                                              "n_edges" = numeric(0), 
                                              "diameter" = numeric(0), 
                                              "mean_distance" = numeric(0), 
                                              "edge_density" = numeric(0),
                                              "reciprocity" = numeric(0), 
                                              "transitivity_global" = numeric(0), 
                                              "transitivity_localaverage" = numeric(0),
                                              "triangles" = numeric(0), 
                                              "mean_in_degree" = numeric(0), 
                                              "max_in_degree" = numeric(0), 
                                              "min_in_degree" = numeric(0), 
                                              "mean_out_degree" = numeric(0), 
                                              "max_out_degree" = numeric(0), 
                                              "min_out_degree" = numeric(0),
                                              "mean_total_degree" = numeric(0), 
                                              "max_total_degree" = numeric(0), 
                                              "min_total_degree" = numeric(0))

for (i in 1:1660){
  edge_path <- paste(graphs_path ,'/non_conspiracy/' ,i ,'/edges.txt', sep="")
  node_path <- paste(graphs_path ,'/non_conspiracy/' ,i ,'/nodes.csv', sep="")
  edges <- read.table(edge_path, quote="\"", comment.char="")
  nodes <- read.csv(node_path)
  g <- graph.data.frame(edges, nodes, directed=T)
  
  # Extract features
  
  n_nodes <- vcount(g)
  n_edges <- ecount(g)
  diameter <- diameter(g, directed=TRUE, weights=NA)
  mean_distance <- mean_distance(g, directed=TRUE)
  edge_density <- edge_density(g)
  reciprocity <- reciprocity(g)
  transitivity_global <- transitivity(g, type="global")
  transitivity_localaverage <- transitivity(g, type="localaverage")
  triangles <- sum(count_triangles(g))/3
  mean_in_degree <- mean(degree(g, mode="in"))
  max_in_degree <- max(degree(g, mode="in"))
  min_in_degree <- min(degree(g, mode="in"))
  mean_out_degree <- mean(degree(g, mode="out"))
  max_out_degree <- max(degree(g, mode="out"))
  min_out_degree <- min(degree(g, mode="out"))
  mean_total_degree <- mean(degree(g, mode="total"))
  max_total_degree <- max(degree(g, mode="total"))
  min_total_degree <- min(degree(g, mode="total"))
  
  # Write features to CSV
  
  feature_vector <- c(n_nodes, n_edges, diameter, mean_distance, edge_density,
                      reciprocity, transitivity_global, transitivity_localaverage,
                      triangles, mean_in_degree, max_in_degree, min_in_degree, 
                      mean_out_degree, max_out_degree, min_out_degree,
                      mean_total_degree, max_total_degree, min_total_degree)
  feature_df_non_conspiracy[nrow(feature_df_non_conspiracy) + 1,] <- feature_vector
  
}

feature_df_other_conspiracy <- data.frame("n_nodes" = numeric(0), 
                                        "n_edges" = numeric(0), 
                                        "diameter" = numeric(0), 
                                        "mean_distance" = numeric(0), 
                                        "edge_density" = numeric(0),
                                        "reciprocity" = numeric(0), 
                                        "transitivity_global" = numeric(0), 
                                        "transitivity_localaverage" = numeric(0),
                                        "triangles" = numeric(0), 
                                        "mean_in_degree" = numeric(0), 
                                        "max_in_degree" = numeric(0), 
                                        "min_in_degree" = numeric(0), 
                                        "mean_out_degree" = numeric(0), 
                                        "max_out_degree" = numeric(0), 
                                        "min_out_degree" = numeric(0),
                                        "mean_total_degree" = numeric(0), 
                                        "max_total_degree" = numeric(0), 
                                        "min_total_degree" = numeric(0))

for (i in 1:397){
  edge_path <- paste(graphs_path ,'/other_conspiracy/' ,i ,'/edges.txt', sep="")
  node_path <- paste(graphs_path ,'/other_conspiracy/' ,i ,'/nodes.csv', sep="")
  edges <- read.table(edge_path, quote="\"", comment.char="")
  nodes <- read.csv(node_path)
  g <- graph.data.frame(edges, nodes, directed=T)
  
  # Extract features
  
  n_nodes <- vcount(g)
  n_edges <- ecount(g)
  diameter <- diameter(g, directed=TRUE, weights=NA)
  mean_distance <- mean_distance(g, directed=TRUE)
  edge_density <- edge_density(g)
  reciprocity <- reciprocity(g)
  transitivity_global <- transitivity(g, type="global")
  transitivity_localaverage <- transitivity(g, type="localaverage")
  triangles <- sum(count_triangles(g))/3
  mean_in_degree <- mean(degree(g, mode="in"))
  max_in_degree <- max(degree(g, mode="in"))
  min_in_degree <- min(degree(g, mode="in"))
  mean_out_degree <- mean(degree(g, mode="out"))
  max_out_degree <- max(degree(g, mode="out"))
  min_out_degree <- min(degree(g, mode="out"))
  mean_total_degree <- mean(degree(g, mode="total"))
  max_total_degree <- max(degree(g, mode="total"))
  min_total_degree <- min(degree(g, mode="total"))
  
  # Write features to CSV
  
  feature_vector <- c(n_nodes, n_edges, diameter, mean_distance, edge_density,
                      reciprocity, transitivity_global, transitivity_localaverage,
                      triangles, mean_in_degree, max_in_degree, min_in_degree, 
                      mean_out_degree, max_out_degree, min_out_degree,
                      mean_total_degree, max_total_degree, min_total_degree)
  feature_df_other_conspiracy[nrow(feature_df_other_conspiracy) + 1,] <- feature_vector
}

write.csv(feature_df_5g_corona_conspiracy,"/Users/maria/Desktop/twitterAnalysis/FakeNews/dataset/graphs/5g_corona_conspiracy/feature_df_5g_corona_conspiracy.csv", row.names = FALSE)
write.csv(feature_df_non_conspiracy,"/Users/maria/Desktop/twitterAnalysis/FakeNews/dataset/graphs/non_conspiracy/feature_df_non_conspiracy.csv", row.names = FALSE)
write.csv(feature_df_other_conspiracy,"/Users/maria/Desktop/twitterAnalysis/FakeNews/dataset/graphs/other_conspiracy/feature_df_other_conspiracy.csv", row.names = FALSE)

