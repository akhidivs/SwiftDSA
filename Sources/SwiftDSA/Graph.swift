//
//  File.swift
//  SwiftDSA
//
//  Created by Akhilesh Mishra on 01/04/25.
//

import Foundation

// ********************
// ****** GRAPH *******
// ********************
/*
 
 A graph data structure is a collection of nodes that has data and are connected to other nodes. More precisely, a graph is a data structure (V, E) that consists of :
 - a collection of vertices V
 - a collection of edges E, represented as ordered pairs of (u, v)
 
 Example:
 V = {0, 1, 2, 3}
 E = {(0, 1), (0, 2), (0, 3), (1, 2)}
 G = {V, E}
 
 
                            0-------3
                          /   \
                         /     \
                        /       \
                       1---------2
 
 Graph Terminology:
 ------------------
 - Adjacency: A vertex is said to be adjacent to another vertex if there is an edge connecting them. Vertices 2 and 3 are not adjacent because there is no edge between them.
 - Path: A sequence of edges that allows you to go from vertex A to vertex B is called a path. 0-1, 1-2 and 0-2 are paths from vertex 0 to vertex 2.
 - Directed Graph: A graph in which an edge (u,v) doesn't necessarily mean that there is an edge (v, u) as well. The edges in such a graph are represented by arrows to show the direction of the edge.
 
 
 Graph Representation:
 ---------------------
 1. Adjacency Matrix:
     - An adjacency matrix is a 2D array of V x V vertices. Each row and column represent a vertex.
     - If the value of any element a[i][j] is 1, it represents that there is an edge connecting vertex i and vertex j.
       The adjacency matrix for the graph we created above is
     
     
     M = [
         [0, 1, 1, 1],
         [1, 0, 1, 0],
         [1, 1, 0, 0],
         [1, 0, 0, 0]]
 
 2. Adjacency List:
     - An adjacency list represents a graph as an array of linked lists.
     - The index of the array represents a vertex and each element in its linked list represents the other vertices that form an edge with the vertex.
     The adjacency list for the graph we made in the first example is as follows:
     
     
     M = [
         0->1->2->3,
         1->0->2,
         2->0->1,
         3->0]
 
 ** An adjacency list is efficient in terms of storage because we only need to store the values for the edges. For a graph with millions of vertices, this can mean a lot of saved space.
 
 Graph Operations:
 -----------------
 - Check if the element is present in the graph
 - Graph Traversal
 - Add elements(vertex, edges) to graph
 - Finding the path from one vertex to another
 
 
 Spanning Tree and Minimum Spanning Tree:
 ----------------------------------------
 
 - Undirected Graph: a graph in which the edges do point in any direction
 - Connected Graph: a graph in which there is always a path from a vertex to any other vertex
 
 Spanning Tree: A spanning tree is a sub-graph of an undirected-connected graph, which includes all the vertices of the graph with a minimum possible number of edges. The edges may or may not have weights assigned to them.
 - The total number of spanning trees with n vertices that can be created from a complete graph is n^(n-2)
 
 Minimum Spanning Tree: a spanning tree in which the sum of the weight of the edges is as minimum as possible.
 
 Strongly connected components:
 ------------------------------
 A strongly connected component is the portion of a directed graph in which there is a path from each vertex to another vertex. It is applicable only on a directed graph.
 
 Strongly Connected Components Applications:
 -------------------------------------------
 - Vehicle routing applications
 - Maps
 - Model-checking in formal verification
 
 
 
 Graph Traversal:
 ----------------
 
 1. Breadth First Search (BFS)
     - It begins with a node, then first traverses all its adjacent nodes. Once all adjacent are visited, then their adjacent are traversed.
     - BFS is different from DFS in a way that closest vertices are visited before others. We mainly traverse vertices level by level.
     - Popular graph algorithms like Dijkstra’s shortest path, Kahn’s Algorithm, and Prim’s algorithm are based on BFS.
     - BFS itself can be used to detect cycle in a directed and undirected graph, find shortest path in an unweighted graph and many more problems.
 
Application of BFS:
    - Shortest path finding
    - cycle detection
    - identify connected components in a graph
    - perform topological sorting on a directed acyclic graph
    - level order traversal of binary trees
 
 Problems on BFS for a Graph:
     - Find the level of a given node in an Undirected Graph
     - Minimize maximum adjacent difference in a path from top-left to bottom-right
     - Minimum jump to the same value or adjacent to reach the end of an Array
     - Maximum coin in minimum time by skipping K obstacles along the path in Matrix
     - Check if all nodes of the Undirected Graph can be visited from the given Node
     - Minimum time to visit all nodes of a given Graph at least once
     - Minimize moves to the next greater element to reach the end of the Array
     - Shortest path by removing K walls
     - Minimum time required to infect all the nodes of the Binary tree
     - Check if destination of given Matrix is reachable with required values of cells
 
 2. Depth First Search (DFS)
 - the algorithm starts from a given source and explores all reachable vertices from the given source.
 
 Applications of DFS:
 - detecting cycle in a graph
 - path finding
 - topological sorting
 - test if a graph is bipartite
 - finding strongly connected components of a graph
 - web crawlers
 - backtracking
 
 
 Problems on DFS for a graph:
     - Find number of islands
     - Transitive closure of a graph using DFS
     - Application of DFS
     - Detect cycle in an undirected graph
     - Longest path between any pair of vertices
     - Find a mother vertex in a graph
     - Iterative Depth first traversal
     - Print all path from a given source to a destination
     - Stepping Number
     - Maximum product of two non- intersecting paths in a tree
 
*/
