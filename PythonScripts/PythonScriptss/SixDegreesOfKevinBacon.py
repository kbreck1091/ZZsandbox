from collections import deque

def find_shortest_path(graph, start_actor, end_actor):
    # Perform breadth-first search to find the shortest path
    visited = set()
    queue = deque([(start_actor, [])])

    while queue:
        current_actor, path = queue.popleft()

        if current_actor == end_actor:
            return path

        if current_actor not in visited:
            visited.add(current_actor)
            for movie, neighbor_actor in graph.get(current_actor, []):
                queue.append((neighbor_actor, path + [movie]))

    # If no path is found
    return None

# Example usage
if __name__ == "__main__":
    # Define a sample graph (movie, actor) where actors are connected through movies
    movie_graph = {
        "X-Men: First Class": [("Jennifer Lawrence", "Kevin Bacon")],
        "Apollo 13": [("Kevin Bacon", "Tom Hanks")]
        # Add more movies and connections as needed
    }

    # Specify the start and end actors
    start_actor = "Jennifer Lawrence"
    end_actor = "Tom Hanks"

    # Find the shortest path
    shortest_path = find_shortest_path(movie_graph, start_actor, end_actor)

    # Display the result
    if shortest_path:
        print(f"Shortest path from {start_actor} to {end_actor}: {shortest_path}")
    else:
        print(f"No path found from {start_actor} to {end_actor}")
