//
//  PVAlgebraMatrix.h
//  
//
//  Created by Pedro Vieira on 03/11/13.
//  Copyright (c) 2013 Pedro Vieira ( https://twitter.com/w1tch_ ). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PVAlgebraMatrix : NSObject {
    NSMutableArray *_matrixData;
    NSInteger _matrixRows;
    NSInteger _matrixColumns;
}

#pragma mark -
#pragma mark PVAlgebraMatrix Init Methods
/**
 *  Creates a new Identity Matrix with a given size (rows & columns).
 *  See http://en.wikipedia.org/wiki/Identity_matrix to learn more about Identity Matrices.
 *
 *  @param size The size (number of rows & columns) of the new Identity Matrix
 *
 *  @return The newly created Identity Matrix
 */
+ (PVAlgebraMatrix *)identityMatrixWithSize:(NSInteger)size;

/**
 *  Creates a new Null Matrix (also known as Zero Matrix) with a given number of rows and columns.
 *  See http://en.wikipedia.org/wiki/Zero_matrix to learn more about Null Matrices.
 *
 *  @param rows    The number of rows that the Null Matrix will have
 *  @param columns The number of columns that the Null Matrix will have
 *
 *  @return The newly created Null Matrix
 */
+ (PVAlgebraMatrix *)nullMatrixWithRows:(NSInteger)rows columns:(NSInteger)columns;

/**
 *  Creates a new Matrix from a given Matrix (it will copy all the elements).
 *
 *  @param matrix The Matrix that will be copied into the new one
 *
 *  @return The newly created Matrix
 */
- (id)initWithMatrix:(PVAlgebraMatrix *)matrix;

/**
 *  Creates a new Matrix with a specific number of rows and columns and all the elements will have the same default value.
 *
 *  @param rows    The number of rows that the new Matrix will have
 *  @param columns The number of columns that the new Matrix will have
 *  @param value   The default value for all the elements of the new Matrix
 *
 *  @return The newly created Matrix
 */
- (id)initWithRows:(NSInteger)rows columns:(NSInteger)columns setDefaultValueForAllElements:(NSInteger)value;



#pragma mark -
#pragma mark PVAlgebraMatrix Access Methods
/**
 *  Returns the array representation of the Matrix.
 *
 *  @return The array representation of the Matrix
 */
- (NSMutableArray *)arrayRepresentation;

/**
 *  Returns the string representation of the Matrix (for example: [(1,1,1),(2,2,2)] ).
 *
 *  @return The string representation of the Matrix
 */
- (NSString *)stringRepresentation;

/**
 *  Returns the number of rows of the Matrix.
 *
 *  @return The number of rows of the Matrix
 */
- (NSInteger)numberOfRows;

/**
 *  Returns the number of columns of the Matrix.
 *
 *  @return The number of columns of the Matrix
 */
- (NSInteger)numberOfColumns;

/**
 *  Returns the minimum value between the number of rows and columns of the matrix.
 *  This method is also known as min{m,n} : "m" being the number of rows of the Matrix and "n" the number of columns
 *
 *  @return The minimum value between the number of rows and columns of the matrix
 */
- (NSInteger)minimumValueFromRowsAndColumns;

/**
 *  Returns the element at the given row and column.
 *  Can also be represented as A[i,j] : "A" being the current matrix, "i" the row and "j" the column.
 *  See http://en.wikipedia.org/wiki/Matrix_(mathematics)#Notation to learn more about entries.
 *
 *  @param row    The row number of the element
 *  @param column The column number of the element
 *
 *  @return The element of the given row and column
 */
- (id)elementAtRow:(NSInteger)row column:(NSInteger)column;

/**
 *  Returns an Array with all the elements of a given row.
 *
 *  @param row The current row number of the Matrix
 *
 *  @return An Array with all the elements of a given row
 */
- (NSArray *)elementsFromRow:(NSInteger)row;

/**
 *  Returns an Array with all the elements of a given column.
 *
 *  @param column The current column number of the Matrix
 *
 *  @return An Array with all the elements of a given column
 */
- (NSArray *)elementsFromColumn:(NSInteger)column;

/**
 *  Returns an Array with all the elements of main diagonal.
 *  See http://en.wikipedia.org/wiki/Main_diagonal to learn more about main diagonals.
 *
 *  @return An Array with all the elements of main diagonal.
 */
- (NSArray *)mainDiagonalElements;



#pragma mark -
#pragma mark PVAlgebraMatrix Action Methods
/**
 *  Replaces the current matrix with a given one.
 *
 *  @param matrix The Matrix that will replace the current one
 */
- (void)setMatrix:(PVAlgebraMatrix *)matrix;

/**
 *  Adds a new row to the end of the matrix with the values of a given Array.
 *
 *  @param rowArray An Array of elements that will be added to the end the Matrix as new line
 */
- (void)addRowFromArray:(NSArray *)rowArray;

/**
 *  Adds a new column to the end of the matrix with the values of a given Array.
 *
 *  @param columnArray An Array of elements that will be added to the end the Matrix as new column
 */
- (void)addColumnFromArray:(NSArray *)columnArray;

/**
 *  Inserts a new row with elements at a given row number and rearranges the other rows.
 *
 *  @param newRow    An Array of elements that will be inserted in the Matrix at a specific row number
 *  @param rowNumber The actual row number
 */
- (void)insertNewRow:(NSArray *)newRow atRow:(NSInteger)rowNumber;

/**
 *  Inserts a new column with elements at a given column number and rearranges the other columns.
 *
 *  @param newRow    An Array of elements that will be inserted in the Matrix at a specific column number
 *  @param rowNumber The actual column number
 */
- (void)insertNewColumn:(NSArray *)newColumn atColumn:(NSInteger)columnNumber;

/**
 *  Removes the entire row located at the given row number and rearranges the remaining rows.
 *
 *  @param rowNumber The actual row number
 */
- (void)removeRow:(NSInteger)rowNumber;

/**
 *  Removes the entire column located at the given column number and rearranges the remaining columns.
 *
 *  @param rowNumber The actual column number
 */
- (void)removeColumn:(NSInteger)columnNumber;

/**
 *  Replaces an element of a given row and column with a given one ( A[row,column] = element ).
 *
 *  @param row     The row number of the element that will be replaced
 *  @param column  The column number of the element that will be replaced
 *  @param element The element that will replace the old one
 */
- (void)replaceElementAtRow:(NSInteger)row column:(NSInteger)column withElement:(id)element;

/**
 *  Adds the given Matrix to the current one.
 *  See http://en.wikipedia.org/wiki/Matrix_addition to learn more about Matrix Addition.
 *
 *  @param matrix The matrix that will be added to the current one
 *
 *  @return The newly created matrix (result of the addition)
 */
- (PVAlgebraMatrix *)addMatrix:(PVAlgebraMatrix *)matrix;

/**
 *  Subtracts the given Matrix to the current one.
 *  See http://en.wikipedia.org/wiki/Matrix_addition to learn more about Matrix Addition (Subtraction).
 *
 *  @param matrix The matrix that will be subtracted to the current one
 *
 *  @return The newly created matrix (result of the subtraction)
 */
- (PVAlgebraMatrix *)subtractMatrix:(PVAlgebraMatrix *)matrix;

/**
 *  Multiplies every element of the matrix by the given scalar.
 *  See http://en.wikipedia.org/wiki/Matrix_(mathematics)#Addition.2C_scalar_multiplication_and_transposition to learn more about Scalar Multiplication.
 *
 *  @param scalar The actual scalar
 *
 *  @return A new matrix that is the result of the scalar multiplication by the matrix
 */
- (PVAlgebraMatrix *)multiplyByScalar:(NSInteger)scalar;

/**
 *  Multiplies the current Matrix by the given one 
 *  (to perform a matrix multiplication, the number of columns of the current matrix must be equal to the number of rows of the given one).
 *  See http://en.wikipedia.org/wiki/Matrix_multiplication#Matrix_product_.28two_matrices.29 to learn more about Matrix Multiplication.
 *
 *  @param scalar The actual Matrix
 *
 *  @return A new matrix that is the result of the scalar multiplication by the matrix
 */
- (PVAlgebraMatrix *)multiplyByMatrix:(PVAlgebraMatrix *)matrix;

/**
 *  Transposes the current matrix.
 *  See http://en.wikipedia.org/wiki/Transpose to learn more about the transpose of matrices.
 *
 *  @return The newly transposed Matrix
 */
- (PVAlgebraMatrix *)transpose;



#pragma mark -
#pragma mark PVAlgebraMatrix Verification Methods
/**
 *  Checks if the Matrix is completely equal to a given Matrix.
 *
 *  @param matrix The current Matrix that will be compared to
 *
 *  @return YES if both are equal, otherwise NO
 */
- (BOOL)isEqualToMatrix:(PVAlgebraMatrix *)matrix;

/**
 *  Checks if the Matrix is a Row Vector (Matrix with only 1 line).
 *  See http://en.wikipedia.org/wiki/Matrix_(mathematics)#Size to learn more about Row Vectors.
 *
 *  @return YES if the Matrix is a Row Vector, otherwise NO
 */
- (BOOL)isRowVector;

/**
 *  Checks if the Matrix is a Column Vector (Matrix with only 1 column).
 *  See http://en.wikipedia.org/wiki/Matrix_(mathematics)#Size to learn more about Column Vectors.
 *
 *  @return YES if the Matrix is a Column Vector, otherwise NO
 */
- (BOOL)isColumnVector;

/**
 *  Checks if the Matrix is a Square Matrix (number of lines = number of columns).
 *  See http://en.wikipedia.org/wiki/Square_matrix to learn more about Square Matrices.
 *
 *  @return YES if the Matrix is a Square Matrix, otherwise NO
 */
- (BOOL)isSquareMatrix;

/**
 *  Checks if the Matrix is a Null Matrix (every element of the Matrix is 0).
 *  See http://en.wikipedia.org/wiki/Zero_matrix to learn more about Null Matrices.
 *
 *  @return YES if the Matrix is a Null Matrix, otherwise NO
 */
- (BOOL)isNullMatrix;

/**
 *  Checks if the current Matrix is an Empty Matrix (number of rows = 0 & number of columns = 0)
 *  See http://en.wikipedia.org/wiki/Matrix_(mathematics)#Empty_matrices to learn more about Empty Matrices
 *
 *  @return YES if the current Matrix is an Empty Matrix, otherwise NO
 */
- (BOOL)isEmptyMatrix;

/**
 *  Checks if the current Matrix is an Identity Matrix.
 *  See http://en.wikipedia.org/wiki/Identity_matrix to learn more about Identity Matrices.
 *
 *  @return YES if the current Matrix is an Identity Matrix, otherwise NO
 */
- (BOOL)isIdentityMatrix;

/**
 *  Checks if the current Matrix is a Diagonal Matrix.
 *  See http://en.wikipedia.org/wiki/Diagonal_matrix to learn more about Diagonal Matrices.
 *
 *  @return YES if the current Matrix is a Diagonal Matrix, otherwise NO
 */
- (BOOL)isDiagonalMatrix;

/**
 *  Checks if the Matrix is an Upper Triangular Matrix.
 *  See http://en.wikipedia.org/wiki/Triangular_matrix#Description to learn more about Upper Triangular Matrices.
 *
 *  @return YES if the Matrix is an Upper Triangular Matrix, otherwise NO
 */
- (BOOL)isUpperTriangularMatrix;

/**
 *  Checks if the Matrix is a Lower Triangular Matrix.
 *  See http://en.wikipedia.org/wiki/Triangular_matrix#Description to learn more about Lower Triangular Matrices.
 *
 *  @return YES if the Matrix is a Lower Triangular Matrix, otherwise NO
 */
- (BOOL)isLowerTriangularMatrix;

/**
 *  Checks if the Matrix is a Triangular Matrix (Upper or Lower).
 *  See http://en.wikipedia.org/wiki/Triangular_matrix to learn more about Triangular Matrices.
 *
 *  @return YES if the Matrix is a Triangular Matrix, otherwise NO
 */
- (BOOL)isTriangularMatrix;

/**
 *  Checks if the Matrix is both Upper and Lower Triangular Matrix.
 *  See http://en.wikipedia.org/wiki/Triangular_matrix#Description to learn more about Triangular Matrices.
 *
 *  @return YES if the Matrix is both Upper and Lower Triangular Matrix, otherwise NO
 */
- (BOOL)isBothUpperAndLowerTriangularMatrix;

/**
 *  Checks if the current Matrix can perform a Matrix Addition with a given Matrix
 *  See http://en.wikipedia.org/wiki/Matrix_addition to learn more about Matrix Additions
 *
 *  @param matrix The matrix that will be used for the verification
 *
 *  @return YES if the addition can be performed, otherwise NO
 */
- (BOOL)canPerformMatrixAdditionWithMatrix:(PVAlgebraMatrix *)matrix;

/**
 *  Checks if the current Matrix can perform a Matrix Subtraction with a given Matrix
 *  See http://en.wikipedia.org/wiki/Matrix_addition#Entrywise_sum to learn more about Matrix Subtractions
 *
 *  @param matrix The matrix that will be used for the verification
 *
 *  @return YES if the subtraction can be performed, otherwise NO
 */
- (BOOL)canPerformMatrixSubtractionWithMatrix:(PVAlgebraMatrix *)matrix;

/**
 *  Checks if the current Matrix can perform a Matrix Multiplication/Product with a given Matrix
 *  See http://en.wikipedia.org/wiki/Matrix_multiplication#Matrix_product_.28two_matrices.29 to learn more about Matrix Multiplication
 *
 *  @param matrix The matrix that will be used for the verification
 *
 *  @return YES if the multiplication can be performed, otherwise NO
 */
- (BOOL)canPerformMatrixMultiplicationWithMatrix:(PVAlgebraMatrix *)matrix;

@end
