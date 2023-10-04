import numpy as np
from scipy.interpolate import CubicSpline

N_POINTS = 629
N_PLANES = 2

def read_points_from_file(filename):
    points = np.zeros((N_POINTS, 3))
    with open(filename, 'r') as file:
        for i in range(N_POINTS):
            x, y, z = map(float, file.readline().split())
            points[i] = [x, y, z]
    return points

def generate_elipsoid(planes):
    elipsoid = np.zeros((N_PLANES * N_POINTS, 3))
    for i in range(N_PLANES):
        x = planes[i, :, 0]
        y = planes[i, :, 1]
        z = planes[i, :, 2]
        spline = CubicSpline(z, x)
        elipsoid[i * N_POINTS: (i + 1) * N_POINTS, 0] = spline(z)
        elipsoid[i * N_POINTS: (i + 1) * N_POINTS, 1] = y
        elipsoid[i * N_POINTS: (i + 1) * N_POINTS, 2] = z
    return elipsoid

def main():
    planes = np.zeros((N_PLANES, N_POINTS, 3))
    planes[0] = read_points_from_file("Circulo1.txt")
    planes[1] = read_points_from_file("Circulo2.txt")

    elipsoid = generate_elipsoid(planes)

    # Exemplo de impressão dos pontos do elipsoide
    for i in range(N_PLANES * N_POINTS):
        print(f"Ponto {i + 1}: x = {elipsoid[i, 0]}, y = {elipsoid[i, 1]}, z = {elipsoid[i, 2]}")

if __name__ == "__main__":
    main()
