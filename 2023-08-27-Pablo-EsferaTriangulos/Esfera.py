import math

def normalize(v):   
    length = math.sqrt(v[0] ** 2 + v[1] ** 2 + v[2] ** 2)
    return [v[0] / length, v[1] / length, v[2] / length]

def add_vertex(vertices, v):
    vertices.append(v)

def add_face(faces, a, b, c):
    faces.append((a, b, c))

def subdivide(vertices, faces, a, b, c, depth, face_inverse):
    if depth == 0:
        if face_inverse == 1:
            add_face(faces, c, b, a)
        else:
            add_face(faces, a, b, c)
        return

    ab = normalize([(vertices[a][0] + vertices[b][0]) / 2.0, (vertices[a][1] + vertices[b][1]) / 2.0, (vertices[a][2] + vertices[b][2]) / 2.0])
    ac = normalize([(vertices[a][0] + vertices[c][0]) / 2.0, (vertices[a][1] + vertices[c][1]) / 2.0, (vertices[a][2] + vertices[c][2]) / 2.0])
    bc = normalize([(vertices[b][0] + vertices[c][0]) / 2.0, (vertices[b][1] + vertices[c][1]) / 2.0, (vertices[b][2] + vertices[c][2]) / 2.0])

    ab_idx = len(vertices)
    ac_idx = len(vertices) + 1
    bc_idx = len(vertices) + 2

    add_vertex(vertices, ab)
    add_vertex(vertices, ac)
    add_vertex(vertices, bc)

    subdivide(vertices, faces, a, ab_idx, ac_idx, depth - 1, face_inverse)
    subdivide(vertices, faces, ab_idx, b, bc_idx, depth - 1, face_inverse)
    subdivide(vertices, faces, ac_idx, bc_idx, c, depth - 1, face_inverse)
    subdivide(vertices, faces, ab_idx, bc_idx, ac_idx, depth - 1, face_inverse)

# Triângulo inicial
v1 = [1.0, 0.0, 0.0]
v2 = [0.0, 1.0, 0.0]
v3 = [0.0, 0.0, 1.0]
v4 = [-1.0, 0.0, 0.0]
v5 = [0.0, -1.0, 0.0]
v6 = [0.0, 0.0, -1.0]






depth = 5

vertices = []
faces = []

add_vertex(vertices, v1)
add_vertex(vertices, v2)
add_vertex(vertices, v3)
add_vertex(vertices, v4)
add_vertex(vertices, v5)
add_vertex(vertices, v6)

#v1 v2 v3 0 1 2
#v4 v2 v3 3 1 2
#v4 v2 v6 3 1 5
#v1 v2 v6 0 1 5
#v4 v5 v6 3 4 5
#v4 v5 v3 3 4 2
#v1 v5 v3 0 4 2
#v1 v5 v6 0 4 5

subdivide(vertices, faces, 0, 1, 2, depth, 0)
subdivide(vertices, faces, 3, 1, 2, depth, 1)
subdivide(vertices, faces, 3, 1, 5, depth,0 )
subdivide(vertices, faces, 0, 1, 5, depth, 1)
subdivide(vertices, faces, 3, 4, 5, depth, 1)
subdivide(vertices, faces, 3, 4, 2, depth, 0)
subdivide(vertices, faces, 0, 4, 2, depth, 1)
subdivide(vertices, faces, 0, 4, 5, depth, 0)

# Escrever as coordenadas dos vértices e faces em um arquivo PLY
with open("Esfera.ply", "w") as ply_file:
    ply_file.write("ply\n")
    ply_file.write("format ascii 1.0\n")
    ply_file.write(f"element vertex {len(vertices)}\n")
    ply_file.write("property float x\n")
    ply_file.write("property float y\n")
    ply_file.write("property float z\n")
    ply_file.write(f"element face {len(faces)}\n")
    ply_file.write("property list uchar int vertex_indices\n")
    ply_file.write("end_header\n")

    for vertex in vertices:
        ply_file.write(f"{vertex[0]} {vertex[1]} {vertex[2]}\n")

    for face in faces:
        ply_file.write(f"3 {face[0]} {face[1]} {face[2]}\n")

print("Arquivo PLY gerado com sucesso.")
