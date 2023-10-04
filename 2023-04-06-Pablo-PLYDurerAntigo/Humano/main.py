# Criando listas vazias para armazenar os pontos
arquivo1X = []
arquivo1Y = []
arquivo1Z = []

arquivo2X = []
arquivo2Y = []
arquivo2Z = []

arquivo3X = []
arquivo3Y = []
arquivo3Z = []

arquivo4X = []
arquivo4Y = []
arquivo4Z = []

pontos_resultantes = []

# Função para ler os pontos de um arquivo e armazená-los nas listas correspondentes


def ler_arquivo(nome_arquivo, listaX, listaY, listaZ):
    with open(nome_arquivo, 'r') as arquivo:
        linhas = arquivo.readlines()
        for linha in linhas:
            ponto = linha.strip().split(' ')
            listaX.append(float(ponto[0]))
            listaY.append(float(ponto[1]))
            listaZ.append(float(ponto[2]))


# Lendo os pontos do arquivo 1
ler_arquivo('arquivo1.txt', arquivo1X, arquivo1Y, arquivo1Z)

# Lendo os pontos do arquivo 2
ler_arquivo('arquivo2.txt', arquivo2X, arquivo2Y, arquivo2Z)

# Lendo os pontos do arquivo 3
ler_arquivo('arquivo3.txt', arquivo3X, arquivo3Y, arquivo3Z)

# Lendo os pontos do arquivo 4
ler_arquivo('arquivo4.txt', arquivo4X, arquivo4Y, arquivo4Z)

# Exemplo de acesso aos pontos
print('Primeiro ponto do arquivo 1:')
print(f'X: {arquivo1X[0]}, Y: {arquivo1Y[0]}, Z: {arquivo1Z[0]}')


def catmull(arquivo1X, arquivo1Y, arquivo1Z, arquivo2X, arquivo2Y, arquivo2Z, arquivo3X, arquivo3Y, arquivo3Z):
    i = len(arquivo1X)
    u, v, w = 1, 1, 1
    j1 = [0.0] * i
    j2 = [0.0] * i
    j3 = [0.0] * i
    j4 = [0.0] * i

    for k in range(i):
        if u > i-1:
            u = 0
        if v > i-1:
            v = 0
        if w > i-1:
            w = 0

        for t in [x * 0.1 for x in range(10)]:
            j1[k] = (-t**3) + (2*(t**2)) - t
            j2[u] = (3*(t**3)) - (5*(t**2)) + 2
            j3[v] = (-3*(t**3)) + (4*(t**2)) + t
            j4[w] = (t**3) - (t**2)
            #1 - 3
            #1 - 4
            #2 - 3
            #2 - 4

            x = 0.5 * ((arquivo2X[k]*j1[k]) + (arquivo4X[u]*j2[u]) +
                       (arquivo1X[v]*j3[v]) + (arquivo3X[w]*j4[w]))
            y = 0.5 * ((arquivo2Y[k]*j1[k]) + (arquivo4Y[u]*j2[u]) +
                       (arquivo1Y[v]*j3[v]) + (arquivo3Y[w]*j4[w]))
            z = 0.5 * ((arquivo2Z[k]*j1[k]) + (arquivo4Z[u]*j2[u]) +
                       (arquivo1Z[v]*j3[v]) + (arquivo3Z[w]*j4[w]))

            pontos_resultantes.append((x, y, z))

            x = 0.5 * ((arquivo4X[k]*j1[k]) + (arquivo1X[u]*j2[u]) +
                       (arquivo3X[v]*j3[v]) + (arquivo2X[w]*j4[w]))
            y = 0.5 * ((arquivo4Y[k]*j1[k]) + (arquivo1Y[u]*j2[u]) +
                       (arquivo3Y[v]*j3[v]) + (arquivo2Y[w]*j4[w]))
            z = 0.5 * ((arquivo4Z[k]*j1[k]) + (arquivo1Z[u]*j2[u]) +
                       (arquivo3Z[v]*j3[v]) + (arquivo2Z[w]*j4[w]))

            pontos_resultantes.append((x, y, z))

            x = 0.5 * ((arquivo1X[k]*j1[k]) + (arquivo2X[u]*j2[u]) +
                       (arquivo3X[v]*j3[v]) + (arquivo4X[w]*j4[w]))
            y = 0.5 * ((arquivo1Y[k]*j1[k]) + (arquivo2Y[u]*j2[u]) +
                       (arquivo3Y[v]*j3[v]) + (arquivo4Y[w]*j4[w]))
            z = 0.5 * ((arquivo1Z[k]*j1[k]) + (arquivo2Z[u]*j2[u]) +
                       (arquivo3Z[v]*j3[v]) + (arquivo4Z[w]*j4[w]))

            pontos_resultantes.append((x, y, z))

            x = 0.5 * ((arquivo4X[k]*j1[k]) + (arquivo2X[u]*j2[u]) +
                       (arquivo3X[v]*j3[v]) + (arquivo1X[w]*j4[w]))
            y = 0.5 * ((arquivo4Y[k]*j1[k]) + (arquivo2Y[u]*j2[u]) +
                       (arquivo3Y[v]*j3[v]) + (arquivo1Y[w]*j4[w]))
            z = 0.5 * ((arquivo4Z[k]*j1[k]) + (arquivo2Z[u]*j2[u]) +
                       (arquivo3Z[v]*j3[v]) + (arquivo1Z[w]*j4[w]))

            pontos_resultantes.append((x, y, z))

            x = 0.5 * ((arquivo3X[k]*j1[k]) + (arquivo2X[u]*j2[u]) +
                       (arquivo4X[v]*j3[v]) + (arquivo1X[w]*j4[w]))
            y = 0.5 * ((arquivo3Y[k]*j1[k]) + (arquivo2Y[u]*j2[u]) +
                       (arquivo4Y[v]*j3[v]) + (arquivo1Y[w]*j4[w]))
            z = 0.5 * ((arquivo3Z[k]*j1[k]) + (arquivo2Z[u]*j2[u]) +
                       (arquivo4Z[v]*j3[v]) + (arquivo1Z[w]*j4[w]))

            pontos_resultantes.append((x, y, z))







        u += 1
        v += 1
        w += 1


# Chamando a função catmull com os pontos dos três arquivos
catmull(arquivo1X, arquivo1Y, arquivo1Z, arquivo2X,
        arquivo2Y, arquivo2Z, arquivo3X, arquivo3Y, arquivo3Z)


def gerar_arquivo_ply(nome_arquivo, pontos):
    with open(nome_arquivo, 'w') as arquivo:
        arquivo.write('ply\n')
        arquivo.write('format ascii 1.0\n')
        arquivo.write(f'element vertex {len(pontos)}\n')
        arquivo.write('property float x\n')
        arquivo.write('property float y\n')
        arquivo.write('property float z\n')
        arquivo.write('element face 0\n')
        arquivo.write('property list uchar int vertex_index\n')
        arquivo.write('end_header\n')
        for ponto in pontos:
            arquivo.write(f'{ponto[0]:.4f} {ponto[1]:.4f} {ponto[2]:.4f}\n')


gerar_arquivo_ply('pontos_resultantes.ply', pontos_resultantes)
