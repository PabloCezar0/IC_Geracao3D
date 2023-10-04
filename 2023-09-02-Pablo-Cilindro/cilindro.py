import math

# Define lists to store the vertex and face data
vertices = []
faces = []

num_segments = 50  # Resolução dos círculos
radius = 5.0  # Raio das esferas
distance_between_spheres = 100.0  # Distância entre as esferas

# Função para criar um círculo em um plano XY
def create_circle(radius, z, num_segments):
    circle_vertices = []
    for i in range(num_segments):
        angle = 2 * math.pi * i / num_segments
        x = radius * math.cos(angle)
        y = radius * math.sin(angle)
        circle_vertices.append((x, y, z))
    return circle_vertices

# Criar vértices para os dois círculos nas extremidades do cilindro
circle1 = create_circle(radius, -distance_between_spheres/2, num_segments)
circle2 = create_circle(radius, distance_between_spheres/2, num_segments)

# Adicionar os vértices dos círculos à lista de vértices
vertices.extend(circle1)
vertices.extend(circle2)

# Criar faces para conectar os vértices dos dois círculos (cilindro)
for i in range(num_segments):
    vertex_index1 = i
    vertex_index2 = (i + 1) % num_segments
    vertex_index3 = i + num_segments
    vertex_index4 = (i + 1) % num_segments + num_segments

    faces.append((vertex_index1, vertex_index2, vertex_index3))
    faces.append((vertex_index2, vertex_index4, vertex_index3))

faces_teste = int(num_segments)

for i in range(faces_teste):
    vertex_index1 = i
    vertex_index2 = (i + num_segments // 2) % num_segments
    vertex_index3 = (i + 1) % num_segments
    vertex_index4 = (i + num_segments // 2 + 1) % num_segments

    faces.append((vertex_index1, vertex_index2, vertex_index3))

for i in range(faces_teste):
    vertex_index1 = i + num_segments
    vertex_index2 = ((i + num_segments // 2) % num_segments) + num_segments
    vertex_index3 = ((i + 1) % num_segments) + num_segments
    vertex_index4 = ((i + num_segments // 2 + 1) % num_segments) + num_segments

    faces.append((vertex_index3, vertex_index2, vertex_index1))

# Escrever os dados em um arquivo PLY
with open("cilindro.ply", "w") as ply_file:
    ply_file.write("ply\n")
    ply_file.write("format ascii 1.0\n")
    ply_file.write("element vertex {}\n".format(len(vertices)))
    ply_file.write("property float x\n")
    ply_file.write("property float y\n")
    ply_file.write("property float z\n")
    ply_file.write("element face {}\n".format(len(faces)))
    ply_file.write("property list uchar int vertex_indices\n")
    ply_file.write("end_header\n")

    # Escrever vértices
    for vertex in vertices:
        ply_file.write("{} {} {}\n".format(vertex[0], vertex[1], vertex[2]))

    # Escrever faces
    for face in faces:
        ply_file.write("3 {} {} {}\n".format(face[0], face[1], face[2]))

print("Arquivo PLY 'output.ply' foi gerado.")