#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

extern int32_t sumS32(int32_t x[], int32_t count);
extern int32_t sumS8(int8_t x[], int32_t count);
extern uint64_t sumU32_64(uint32_t x[], uint32_t count);
extern uint32_t countNegative (int32_t x[], uint32_t count);
extern uint32_t countNonNegative (int32_t x[], uint32_t count);
extern uint8_t countMatches(char str[], char toMatch);
extern void uint8ToBinaryString(char str[], uint8_t x);
extern void int16ToBinaryString(char str[], int16_t x);
extern bool getParity(uint32_t x);
extern int32_t returnMax(int32_t x[], uint32_t count);
extern int32_t returnMin(int32_t x[], uint32_t count);

#define COUNT 5

int main(void) {
	
	int32_t resultS32;
	int32_t arrayInt32[COUNT] = {128, 256, 512, 1024, 2048};
	
	int8_t arrayInt8[COUNT] = {1, 2, 3, 4, 5};
	int8_t resultS8;
	
	uint64_t resultU64;
	
	uint32_t resultU32;
	uint32_t arrayUint32[COUNT] = {4000000000, 4000000000, 4000000000, 4000000000, 4000000000};
	
	uint8_t resultU8;
	
	bool resultB;
	
	printf("Question 1, sumS32: Correct answer = 3968\n");
	printf("Question 1, sumS32: Student answer = %d\n\n", sumS32(arrayInt32, COUNT));
	
	printf("Question 2, sumS8: Correct answer = 15\n");
	printf("Question 2, sumS8: Student answer = %d\n\n", sumS8(arrayInt8, COUNT));
	
	printf("Question 3, sumU32_64: Correct answer = 20000000000\n");
	printf("Question 3, sumU32_64: Student answer = %lld\n\n", sumU32_64(arrayUint32, COUNT));
	
	arrayInt32[3] = 0;
	arrayInt32[4] = -2048;
	
	printf("Question 4, countNegative: Correct answer = 1\n");
	printf("Question 4, countNegative: Student answer = %d\n\n", countNegative(arrayInt32, COUNT));
	
	printf("Question 5, countNonNegative: Correct answer = 4\n");
	printf("Question 5, countNonNegative: Student answer = %d\n\n", countNonNegative(arrayInt32, COUNT));
	
	char str[] = "3.6 roentgen - not great, not terrible.";
	
	printf("Question 6, countMatches: Correct Answer = 5\n");
	printf("Question 6, countMatches: Student Answer = %d\n\n", countMatches(str, 't'));
	
	char toBin8[8];
	uint8ToBinaryString(toBin8, 10);
	
	printf("Question 7, uint8ToBinaryString: Correct Answer = 00001010\n");
	printf("Question 7, uint8ToBinaryString: Student Answer = %s\n\n", toBin8);
	
	char toBin16[16];
	int16ToBinaryString(toBin16, 1023);
	
	printf("Question 8, uint16ToBinaryString: Correct Answer = 0000001111111111\n");
	printf("Question 8, uint16ToBinaryString: Student Answer = %s\n\n", toBin16);
	
	printf("Question 9, getParity, test 1: Correct Answer = 0\n");
	printf("Question 9, getParity, test 1: Student Answer = %d\n\n", getParity(1023));
	
	printf("Question 9, getParity, test 2: Correct Answer = 1\n");
	printf("Question 9, getParity, test 2: Student Answer = %d\n\n", getParity(1022));
	
	printf("Question 10, returnMax: Correct Answer = 512\n");
	printf("Question 10, returnMax: Student Answer = %d\n\n", returnMax(arrayInt32, COUNT));
	
	printf("Question 11, returnMin: Correct Answer = -2048\n");
	printf("Question 11, returnMin: Student Answer = %d\n\n", returnMin(arrayInt32, COUNT));
	
	return EXIT_SUCCESS;
}
