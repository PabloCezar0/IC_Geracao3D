#include <stdio.h>
#include <math.h>

int main() {
    
    FILE *plyFile;
    plyFile = fopen("circulo3D.ply", "w"); // Abre o arquivo PLY para escrita
    
    if (plyFile == NULL) {
        printf("Erro ao abrir o arquivo.\n");
        return 1;
    }
    
    fprintf(plyFile, "ply\n");
    fprintf(plyFile, "format ascii 1.0\n");
    
    int numVertices = 0;
    int numFaces = 0;
    
    float t = 0.0;
    float x, y;
    float r = 1.0;
    
    // Gerar vértices e contar
    for (t = 0.0; t <= 6.3; t += 0.1) {
        x = r * cos(t);
        y = r * sin(t);
        fprintf(plyFile, "%f %f 0.0\n", x, y);
        numVertices++;
    }
    
    // Gerar faces conectando os vértices em triângulos
    for (int i = 0; i < numVertices - 1; i++) {
        fprintf(plyFile, "3 %d %d %d\n", i, i + 1, numVertices);
        numFaces++;
    }
    fprintf(plyFile, "3 %d 0 %d\n", numVertices - 1, numVertices); // Conecta o último vértice ao primeiro
    numFaces++;
    
    // Atualize o número de vértices e faces no cabeçalho
    fprintf(plyFile, "element vertex %d\n", numVertices);
    fprintf(plyFile, "property float x\n");
    fprintf(plyFile, "property float y\n");
    fprintf(plyFile, "property float z\n");
    fprintf(plyFile, "element face %d\n", numFaces);
    fprintf(plyFile, "property list uchar int vertex_indices\n");
    fprintf(plyFile, "end_header\n");
    
    fclose(plyFile); // Fecha o arquivo PLY
    
    return 0;
}
