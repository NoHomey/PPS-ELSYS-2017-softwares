#include <stdio.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <unistd.h>

#include <stdlib.h>

#include <string.h>

int set_matrix(int *x, int *y, int*** matr, char* name);
void print_matrix(int *x, int *y, int*** matr);

int main(){

    int** matr1;
    int** matr2;

    int x1 = 0, y1 = 0;
    int x2 = 0, y2 = 0;
    
    set_matrix(&x1, &y1, &matr1, "matrix1.csv");
    set_matrix(&x2, &y2, &matr2, "matrix2.csv");

    if(x1 != x1 || y1 != y2){
        printf("undefined\n");
        return 0;
    }else{
        for(int i = 0 ; i < x1 ; ++ i){
            for(int j = 0 ; j < y1 ; ++ j){
                matr1[i][j] += matr2[i][j];
            }
        }

        int asym = 0;
        for(int i = 0 ; i < x1 && asym != 1; ++ i){
            for(int j = 0 ; j < y1 ; ++ j){
                if(matr1[i][j] != matr1[j][i]){
                    printf("false\n");
                    asym = 1;
                    break;
                }
            }
        }
        if(asym == 0){
            printf("true\n");
        }
    }
        
    free(matr1);
    free(matr2);
    return 0;
}

int set_matrix(int *x, int *y, int*** matr, char* name){
    int zx = 0, zy = 0;
    int** zmatr;
    int init_size = 10;

    char buff[100];
    int rread = 0;
    
    int fd = open(name, O_RDONLY);
    
    zmatr = malloc(1 * sizeof(int*));
    zmatr[0] = malloc(init_size * sizeof(int));
    
    char num[10];
    int dig = 0;
    int cntr = 0;
            
    while((rread = read(fd, buff, 100)) != 0){
        for(int i = 0 ; i < rread ; ++ i){
            if(cntr == init_size - 1){
                init_size *= 2;
                zmatr[zx] = realloc(zmatr[zx], init_size * sizeof(int));
            }
            //fprintf(stderr, "Hello!", strlen("Hello!"));
            if(buff[i] == '\n'){
                zmatr[zx][cntr] = atoi(num);
                memset(num, 0, 10);
                dig = 0;
                ++cntr;

                ++ zx;
                zmatr = realloc(zmatr, (zx + 1) * sizeof(int*));
                zy = cntr;
                zmatr[zx] = malloc(cntr * sizeof(int));
                cntr = 0;
            }else{
                if(buff[i] != ','){
                    num[dig] = buff[i];
                    ++ dig;
                }else{
                    zmatr[zx][cntr] = atoi(num);
                    memset(num, 0, 10);
                    ++ cntr;
                    dig = 0;
                }
            }
        }
    }

    *matr = zmatr;
    *x = zx;
    *y = zy;

    close(fd);

    return 0;
}

void print_matrix(int *x, int *y, int*** matr){
    for(int i = 0 ; i < *x ; ++ i){
        for(int j = 0 ; j < *y ; ++ j){
            printf("%d ", (*matr)[i][j]);
        }
        printf("\n");
    }
}
