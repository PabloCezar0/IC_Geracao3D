import numpy as np

def create_sphere(radius, num_segments):
    vertices = []
    faces = []

    for i in range(num_segments + 1):
        phi = i * 2 * np.pi / num_segments
        for j in range(num_segments // 2 + 1):
            theta = j * np.pi / (num_segments // 2)

            x = radius * np.sin(theta) * np.cos(phi)
            y = radius * np.sin(theta) * np.sin(phi)
            z = radius * np.cos(theta)

            vertices.append([x, y, z])

    num_vertices = len(vertices)

    for i in range(num_segments):
        for j in range(num_segments // 2):
            v0 = i * (num_segments // 2 + 1) + j
            v1 = v0 + 1
            v2 = v0 + num_segments // 2 + 1
            v3 = v1 + num_segments // 2 + 1

            faces.append([v0, v1, v2])
            faces.append([v1, v3, v2])

    return vertices, faces


def save_to_ply(vertices, faces, filename):
    with open(filename, 'w') as ply_file:
        ply_file.write('ply\n')
        ply_file.write('format ascii 1.0\n')
        ply_file.write(f'element vertex {len(vertices)}\n')
        ply_file.write('property float x\n')
        ply_file.write('property float y\n')
        ply_file.write('property float z\n')
        ply_file.write(f'element face {len(faces)}\n')
        ply_file.write('property list uchar int vertex_indices\n')
        ply_file.write('end_header\n')

        for vertex in vertices:
            ply_file.write(f'{vertex[0]} {vertex[1]} {vertex[2]}\n')

        for face in faces:
            ply_file.write(f'3 {face[0]} {face[1]} {face[2]}\n')

radius = 1.0
num_segments = 50
vertices, faces = create_sphere(radius, num_segments)
save_to_ply(vertices, faces, 'esfera.ply')
