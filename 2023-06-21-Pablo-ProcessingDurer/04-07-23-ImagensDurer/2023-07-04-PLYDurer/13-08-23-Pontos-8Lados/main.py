import math

pontos_resultantes = []
pontos_hexagono1, pontos_hexagono2, pontos_hexagono3, pontos_hexagono4 = [], [], [], []



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

def reduzir_pontos_sequenciais(pontos):
    pontos_reduzidos = [pontos[0]]
    sequencia = 1
    for i in range(1, len(pontos)):
        if (pontos[i][0] == pontos[i - 1][0] and pontos[i][0] != 0) or (pontos[i][2] == pontos[i - 1][2] and pontos[i][2] != 0):
            sequencia += 1
            pontos_reduzidos[-1][1] = (pontos_reduzidos[-1][1] * (sequencia - 1) + pontos[i][1]) / sequencia
        else:
            sequencia = 1
            pontos_reduzidos.append(pontos[i])

    return pontos_reduzidos



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


def realizar_tratamento(arquivo1, arquivo2):
    # Organizar pontos por Y
    arquivo1_ordenado = organizar_pontos(arquivo1)
    arquivo2_ordenado = organizar_pontos(arquivo2)


    #print(len(arquivo1_ordenado))
    #print(len(arquivo2_ordenado))
    #arquivo1_reduzido = reduzir_pontos_sequenciais(arquivo1_ordenado)
    #arquivo2_reduzido = reduzir_pontos_sequenciais(arquivo2_ordenado)
    #print(len(arquivo1_reduzido))
    #print(len(arquivo2_reduzido))
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



def hexagono(arquivo1, arquivo2, arquivo3, arquivo4):     


 
    for b in range(len(arquivo1)):
        pontos_hexagono1.append(transformar_em_hexagono(arquivo1[b], 45))

    for b in range(len(arquivo2)):
        pontos_hexagono2.append(transformar_em_hexagono(arquivo2[b], 45))

    for b in range(len(arquivo3)):
        pontos_hexagono3.append(transformar_em_hexagono(arquivo3[b], 45))
        
    for b in range(len(arquivo4)):
        pontos_hexagono4.append(transformar_em_hexagono(arquivo4[b], 45))




def catmull(A1, A2, A3, A4, H1, H2, H3, H4):

    gerar_arquivo_ply('hexagono1.ply', H1)
    gerar_arquivo_ply('hexagono2.ply', H2)
    gerar_arquivo_ply('hexagono3.ply', H3)
    gerar_arquivo_ply('hexagono4.ply', H4)
    gerar_arquivo_ply('arquivo1.ply', A1)
    gerar_arquivo_ply('arquivo2.ply', A2)
    gerar_arquivo_ply('arquivo3.ply', A3)
    gerar_arquivo_ply('arquivo4.ply', A4)
    

    max_linhas = max(len(A1), len(A2),
                     len(A3), len(A4))

    i = max_linhas
    u, v, w, k = 0, 0, 0, 0
    q, e, r, h = 0, 0, 0, 0
    j1 = [0.0] * i
    j2 = [0.0] * i
    j3 = [0.0] * i
    j4 = [0.0] * i

    # Calcule o fator de escala para cada arquivo
    escala_arquivo1 = (len(A1) / max_linhas)
    escala_arquivo2 = (len(A2) / max_linhas)
    escala_arquivo3 = (len(A3) / max_linhas)
    escala_arquivo4 = (len(A4) / max_linhas)

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



            x = 0.5 * ((H1[k][0]*j1[k]) + (A1[k][0]*j2[u]) +
                       (H3[v][0]*j3[v]) + (A3[v][0]*j4[w]))

            y = 0.5 * ((H1[k][1]*j1[k]) + (A1[k][1]*j2[u]) +
                       (H3[v][1]*j3[v]) + (A3[v][1]*j4[w]))

            z = 0.5 * ((H1[k][2]*j1[k]) + (A1[k][2]*j2[u]) +
                       (H3[v][2]*j3[v]) + (A3[v][2]*j4[w]))

            pontos_resultantes.append((x, y, z))


            x = 0.5 * ((A1[k][0]*j1[k]) + (H3[v][0]*j2[u]) +
                       (A3[v][0]*j3[v]) + (H2[u][0]*j4[w]))

            y = 0.5 * ((A1[k][1]*j1[k]) + (H3[v][1]*j2[u]) +
                       (A3[v][1]*j3[v]) + (H2[u][1]*j4[w]))

            z = 0.5 * ((A1[k][2]*j1[k]) + (H3[v][2]*j2[u]) +
                       (A3[v][2]*j3[v]) + (H2[u][2]*j4[w]))

            pontos_resultantes.append((x, y, z))

            x = 0.5 * ((H3[v][0]*j1[k]) + (A3[v][0]*j2[u]) +
                       (H2[u][0]*j3[v]) + (A2[u][0]*j4[w]))

            y = 0.5 * ((H3[v][1]*j1[k]) + (A3[v][1]*j2[u]) +
                       (H2[u][1]*j3[v]) + (A2[u][1]*j4[w]))

            z = 0.5 * ((H3[v][2]*j1[k]) + (A3[v][2]*j2[u]) +
                       (H2[u][2]*j3[v]) + (A2[u][2]*j4[w]))

            pontos_resultantes.append((x, y, z))

            x = 0.5 * ((A3[v][0]*j1[k]) + (H2[u][0]*j2[u]) +
                       (A2[u][0]*j3[v]) + (H4[w][0]*j4[w]))

            y = 0.5 * ((A3[v][1]*j1[k]) + (H2[u][1]*j2[u]) +
                       (A2[u][1]*j3[v]) + (H4[w][1]*j4[w]))

            z = 0.5 * ((A3[v][2]*j1[k]) + (H2[u][2]*j2[u]) +
                       (A2[u][2]*j3[v]) + (H4[w][2]*j4[w]))

            pontos_resultantes.append((x, y, z))


            x = 0.5 * ((H2[u][0]*j1[k]) + (A2[u][0]*j2[u]) +
                       (H4[w][0]*j3[v]) + (A4[w][0]*j4[w]))

            y = 0.5 * ((H2[u][1]*j1[k]) + (A2[u][1]*j2[u]) +
                       (H4[w][1]*j3[v]) + (A4[w][1]*j4[w]))

            z = 0.5 * ((H2[u][2]*j1[k]) + (A2[u][2]*j2[u]) +
                       (H4[w][2]*j3[v]) + (A4[w][2]*j4[w]))

            pontos_resultantes.append((x, y, z))

            x = 0.5 * ((A2[u][0]*j1[k]) + (H4[w][0]*j2[u]) +
                       (A4[w][0]*j3[v]) + (H1[k][0]*j4[w]))

            y = 0.5 * ((A2[u][1]*j1[k]) + (H4[w][1]*j2[u]) +
                       (A4[w][1]*j3[v]) + (H1[k][1]*j4[w]))

            z = 0.5 * ((A2[u][2]*j1[k]) + (H4[w][2]*j2[u]) +
                       (A4[w][2]*j3[v]) + (H1[k][2]*j4[w]))

            pontos_resultantes.append((x, y, z))


            x = 0.5 * ((H4[w][0]*j1[k]) + (A4[w][0]*j2[u]) +
                       (H1[k][0]*j3[v]) + (A1[k][0]*j4[w]))

            y = 0.5 * ((H4[w][1]*j1[k]) + (A4[w][1]*j2[u]) +
                       (H1[k][1]*j3[v]) + (A1[k][1]*j4[w]))

            z = 0.5 * ((H4[w][2]*j1[k]) + (A4[w][2]*j2[u]) +
                       (H1[k][2]*j3[v]) + (A1[k][2]*j4[w]))

            pontos_resultantes.append((x, y, z))

            x = 0.5 * ((A4[w][0]*j1[k]) + (H1[k][0]*j2[u]) +
                       (A1[k][0]*j3[v]) + (H3[v][0]*j4[w]))

            y = 0.5 * ((A4[w][1]*j1[k]) + (H1[k][1]*j2[u]) +
                       (A1[k][1]*j3[v]) + (H3[v][1]*j4[w]))

            z = 0.5 * ((A4[w][2]*j1[k]) + (H1[k][2]*j2[u]) +
                       (A1[k][2]*j3[v]) + (H3[v][2]*j4[w]))

            pontos_resultantes.append((x, y, z))






        q += (escala_arquivo1)
        e += (escala_arquivo2)
        r += (escala_arquivo3)
        h += (escala_arquivo4)




def interpolar_pontos2(p1, p2, t):
    p1 = [float(x) for x in p1]
    p2 = [float(x) for x in p2]
    return [p1[0]+t*p2[0], p1[1], p1[2]]

def interpolar_pontos1(p1, p2, t):
    p1 = [float(x) for x in p1]
    p2 = [float(x) for x in p2]
    return [p1[0]+t*p2[0], p1[1], p1[2]]


def rotate_y(points, angle_degrees):
    angle_radians = math.radians(angle_degrees)
    cos_theta = math.cos(angle_radians)
    sin_theta = math.sin(angle_radians)

    points = [float(x) for x in points]

    return [points[0] * cos_theta + points[2] * sin_theta, points[1], -points[0] * sin_theta + points[2] * cos_theta]

def transformar_em_hexagono(ponto, grau):

    #U = [B[0], A[1], B[2]]
    #V = [C[0], D[1], C[2]]
    #K = [A[0], B[1], A[2]]
    #W = [D[0], C[1], D[2]]

    #t1 = 1.0 
    #t2 = 1.0

    #P1 = interpolar_pontos1(A, U, t1)
    #P2 = interpolar_pontos2(B, W, t1)
    #P3 = interpolar_pontos2(C, K, t2)
    #P4 = interpolar_pontos1(D, V, t2)

    P1 = rotate_y(ponto, grau)
    #P2 = rotate_y(B, 45)
    #P3 = rotate_y(C, 45)
    #P4 = rotate_y(B, -45)

    return P1




# Lendo os pontos do arquivo BracoFrente.txt
arquivo1 = ler_arquivo('CabecaFrente.txt')

# Lendo os pontos do arquivo BracoPerfil.txt
arquivo2 = ler_arquivo('CabecaPerfil.txt')

# Realizando o tratamento nos arquivos
arquivo1_maiores_ou_iguais, arquivo1_menores, arquivo2_maiores_ou_iguais, arquivo2_menores = realizar_tratamento(
    arquivo1, arquivo2)



hexagono(arquivo1_maiores_ou_iguais, arquivo1_menores,
        arquivo2_maiores_ou_iguais, arquivo2_menores)


#Chamando a função catmull com os pontos tratados
catmull(arquivo1_maiores_ou_iguais, arquivo1_menores,
        arquivo2_maiores_ou_iguais, arquivo2_menores,
        pontos_hexagono1, pontos_hexagono2,
        pontos_hexagono3, pontos_hexagono4)




gerar_arquivo_ply('pontos_resultantes.ply', pontos_resultantes),






