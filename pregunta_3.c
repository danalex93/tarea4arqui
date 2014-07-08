#include <stdio.h>
#include <stdlib.h>

long long int fibonacci(int cantidad, int acumulado, int anterior)
{
	int nuevo_anterior;
	if (cantidad == 0)
		return acumulado;
	else
	{
		nuevo_anterior = acumulado;
		acumulado += anterior;
		return fibonacci((cantidad-1),acumulado,nuevo_anterior);
	}
}

float fibonacci_serie(int cantidad, float acumulado, float anterior)
{
	int nuevo_anterior;
	if (cantidad == 0)
	{
		return acumulado;
	}
	else
	{
		nuevo_anterior = acumulado;
		acumulado += 1/((float) (fibonacci(cantidad,0,1)));
		return fibonacci_serie((cantidad-1),acumulado,anterior);
	}
}

int main(int argc, char const *argv[])
{
	int cantidad;
	printf("Ingresar cantidad: ");
	scanf("%d",&cantidad);
	printf("Fibonúmero: %d\n", fibonacci(cantidad,0,1));
	printf("Fiboserie: %f\n", fibonacci_serie(cantidad,0.0,1.0));
	return 0;
}