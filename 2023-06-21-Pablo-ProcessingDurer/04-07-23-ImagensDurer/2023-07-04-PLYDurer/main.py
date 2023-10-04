import math

pontos_resultantes = []


def ler_arquivo(nome_arquivo):
    pontos = []
    with open(nome_arquivo, 'r') as arquivo:
        linhas = arquivo.readlines()
        for linha in linhas:
            ponto = linha.strip().split()
            pontos.append([float(ponto[0]), float(ponto[1]), float(ponto[2])])
    return pontos


def organizar_pontos(pontos):
    pontos_ordenados = sorted(pontos, key=lambda ponto: ponto[1])
    return pontos_ordenados


def calcular_media_e_subtrair(pontos, eixo):
    soma = 0
    for ponto in pontos:
        soma += ponto[eixo]
    media = int(soma / len(pontos))

    pontos_tratados = []
    for ponto in pontos:
        ponto_tratado = ponto.copy()
        ponto_tratado[eixo] -= media
        pontos_tratados.append(ponto_tratado)

    return pontos_tratados


def separar_por_media(pontos, eixo):
    media = sum(ponto[eixo] for ponto in pontos) / len(pontos)

    maiores_ou_iguais = []
    menores = []
    for ponto in pontos:
        if ponto[eixo] >= media:
            maiores_ou_iguais.append(ponto)
        else:
            menores.append(ponto)

    return maiores_ou_iguais, menores


def realizar_tratamento(arquivo1, arquivo2):
    # Organizar pontos por Y
    arquivo1_ordenado = organizar_pontos(arquivo1)
    arquivo2_ordenado = organizar_pontos(arquivo2)

    # Calcular média e subtrair no eixo X para arquivo1
    arquivo1_tratado = calcular_media_e_subtrair(arquivo1_ordenado, 0)

    # Calcular média e subtrair no eixo Z para arquivo2
    arquivo2_tratado = calcular_media_e_subtrair(arquivo2_ordenado, 2)

    # Separar por média no eixo X para arquivo1
    arquivo1_maiores_ou_iguais, arquivo1_menores = separar_por_media(
        arquivo1_tratado, 0)

    # Separar por média no eixo Z para arquivo2
    arquivo2_maiores_ou_iguais, arquivo2_menores = separar_por_media(
        arquivo2_tratado, 2)

    return arquivo1_maiores_ou_iguais, arquivo1_menores, arquivo2_maiores_ou_iguais, arquivo2_menores


def catmull(arquivo1, arquivo2, arquivo3, arquivo4):

    max_linhas = max(len(arquivo1), len(arquivo2),
                     len(arquivo3), len(arquivo4))

    i = max_linhas
    u, v, w, k = 0, 0, 0, 0
    q, e, r, h = 0, 0, 0, 0
    j1 = [0.0] * i
    j2 = [0.0] * i
    j3 = [0.0] * i
    j4 = [0.0] * i

    # Calcule o fator de escala para cada arquivo
    escala_arquivo1 = (len(arquivo1) / max_linhas)
    escala_arquivo2 = (len(arquivo2) / max_linhas)
    escala_arquivo3 = (len(arquivo3) / max_linhas)
    escala_arquivo4 = (len(arquivo4) / max_linhas)

    for b in range(max_linhas):
        if k > i - 1:
            k = 0
        if u > i - 1:
            u = 0
        if v > i - 1:
            v = 0
        if w > i - 1:
            w = 0

        for t in [x * 0.1 for x in range(10)]:
            k, u, v, w = math.floor(q), math.floor(
                e), math.floor(r), math.floor(h)

            j1[k] = (-t**3) + (2*(t**2)) - t
            j2[u] = (3*(t**3)) - (5*(t**2)) + 2
            j3[v] = (-3*(t**3)) + (4*(t**2)) + t
            j4[w] = (t**3) - (t**2)

            # 1 - 3
            # 1 - 4
            # 2 - 3
            # 2 - 4

            x = 0.5 * ((arquivo2[u][0]*j1[k]) + (arquivo4[w][0]*j2[u]) +
                       (arquivo1[k][0]*j3[v]) + (arquivo3[v][0]*j4[w]))

            y = 0.5 * ((arquivo2[u][1]*j1[k]) + (arquivo4[w][1]*j2[u]) +
                       (arquivo1[k][1]*j3[v]) + (arquivo3[v][1]*j4[w]))

            z = 0.5 * ((arquivo2[u][2]*j1[k]) + (arquivo4[w][2]*j2[u]) +
                       (arquivo1[k][2]*j3[v]) + (arquivo3[v][2]*j4[w]))

            pontos_resultantes.append((x, y, z))

            x = 0.5 * ((arquivo4[w][0]*j1[k]) + (arquivo1[k][0]*j2[u]) +
                       (arquivo3[v][0]*j3[v]) + (arquivo2[u][0]*j4[w]))

            y = 0.5 * ((arquivo4[w][1]*j1[k]) + (arquivo1[k][1]*j2[u]) +
                       (arquivo3[v][1]*j3[v]) + (arquivo2[u][1]*j4[w]))

            z = 0.5 * ((arquivo4[w][2]*j1[k]) + (arquivo1[k][2]*j2[u]) +
                       (arquivo3[v][2]*j3[v]) + (arquivo2[u][2]*j4[w]))

            pontos_resultantes.append((x, y, z))

            x = 0.5 * ((arquivo1[k][0]*j1[k]) + (arquivo2[u][0]*j2[u]) +
                       (arquivo3[v][0]*j3[v]) + (arquivo4[w][0]*j4[w]))

            y = 0.5 * ((arquivo1[k][1]*j1[k]) + (arquivo2[u][1]*j2[u]) +
                       (arquivo3[v][1]*j3[v]) + (arquivo4[w][1]*j4[w]))

            z = 0.5 * ((arquivo1[k][2]*j1[k]) + (arquivo2[u][2]*j2[u]) +
                       (arquivo3[v][2]*j3[v]) + (arquivo4[w][2]*j4[w]))

            pontos_resultantes.append((x, y, z))


            x = 0.5 * ((arquivo3[v][0]*j1[k]) + (arquivo2[u][0]*j2[u]) +
                       (arquivo4[w][0]*j3[v]) + (arquivo1[k][0]*j4[w]))

            y = 0.5 * ((arquivo3[v][1]*j1[k]) + (arquivo2[u][1]*j2[u]) +
                       (arquivo4[w][1]*j3[v]) + (arquivo1[k][1]*j4[w]))

            z = 0.5 * ((arquivo3[v][2]*j1[k]) + (arquivo2[u][2]*j2[u]) +
                       (arquivo4[w][2]*j3[v]) + (arquivo1[k][2]*j4[w]))

            pontos_resultantes.append((x, y, z))

        q += (escala_arquivo1)
        e += (escala_arquivo2)
        r += (escala_arquivo3)
        h += (escala_arquivo4)


# Lendo os pontos do arquivo BracoFrente.txt
arquivo1 = ler_arquivo('BracoFrente.txt')

# Lendo os pontos do arquivo BracoPerfil.txt
arquivo2 = ler_arquivo('BracoPerfil.txt')

# Realizando o tratamento nos arquivos
arquivo1_maiores_ou_iguais, arquivo1_menores, arquivo2_maiores_ou_iguais, arquivo2_menores = realizar_tratamento(
    arquivo1, arquivo2)

# Chamando a função catmull com os pontos tratados
catmull(arquivo1_maiores_ou_iguais, arquivo1_menores,
        arquivo2_maiores_ou_iguais, arquivo2_menores)


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
