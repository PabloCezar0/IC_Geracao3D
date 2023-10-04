import math

def write_ply(vertices, faces, filename):
    with open(filename, 'w') as f:
        num_vertices = len(vertices)
        num_faces = len(faces)
        
        f.write("ply\n")
        f.write("format ascii 1.0\n")
        f.write(f"element vertex {num_vertices}\n")
        f.write("property float x\n")
        f.write("property float y\n")
        f.write("property float z\n")
        f.write(f"element face {num_faces}\n")
        f.write("property list uchar int vertex_indices\n")
        f.write("end_header\n")
        
        for vertex in vertices:
            f.write(f"{vertex[0]} {vertex[1]} {vertex[2]}\n")
        
        for face in faces:
            f.write(f"4 {face[0]} {face[1]} {face[2]} {face[3]}\n")

r = 1.0
vertices = []
faces = []

t = 0.0
r = 6.4
i = 0
k = int((r*10)/2)

while t <= r:
    x = r * math.cos(t)
    y = r * math.sin(t)
    z = 0.0
    vertices.append((x, y, z))
    if k + i + 1 < r*10:  
        faces.append((i, k+i, k+i+1, i + 1))
    
    t += 0.1
    i += 1


write_ply(vertices, faces, "output.ply")
