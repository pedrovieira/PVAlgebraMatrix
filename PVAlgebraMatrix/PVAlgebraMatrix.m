//
//  PVAlgebraMatrix.m
//  
//
//  Created by Pedro Vieira on 03/11/13.
//  Copyright (c) 2013 Pedro Vieira ( https://twitter.com/w1tch_ ). All rights reserved.
//

#import "PVAlgebraMatrix.h"

@interface PVAlgebraMatrix (Private)
- (id)initWithPredefinedMatrixArray:(NSMutableArray *)array rows:(NSInteger)rows columns:(NSInteger)columns;
- (NSMutableArray *)createEntirelyNewArrayUsingArrayRepresentationFromMatrix:(PVAlgebraMatrix *)matrix;
@end

@implementation PVAlgebraMatrix

#pragma mark -
#pragma mark Private PVAlgebraMatrix Methods
- (id)initWithPredefinedMatrixArray:(NSMutableArray *)array rows:(NSInteger)rows columns:(NSInteger)columns {
    if (self = [super init]) {
        _matrixData = array;
        _matrixRows = rows;
        _matrixColumns = columns;
    }
    return self;
}

- (NSMutableArray *)createEntirelyNewArrayUsingArrayRepresentationFromMatrix:(PVAlgebraMatrix *)matrix {
    NSMutableArray *newMatrixArray = [[NSMutableArray alloc] init];
    
    for (int m = 0; m < matrix.numberOfRows; m++){
        NSMutableArray *innerMatrixData = [[NSMutableArray alloc] init];
        for (int n = 0; n < matrix.numberOfColumns; n++){
            innerMatrixData[n] = [matrix elementAtRow:m+1 column:n+1];
        }
        newMatrixArray[m] = innerMatrixData;
    }
    
    return newMatrixArray;
}

#pragma mark -
#pragma mark PVAlgebraMatrix Init Methods
+ (PVAlgebraMatrix *)identityMatrixWithSize:(NSInteger)size {
    NSMutableArray *globalMatrixData = [[NSMutableArray alloc] init];
    
    if (size <= 0){
        size = 1;
    }
    
    for (int m = 0; m < size; m++){
        NSMutableArray *innerMatrixData = [[NSMutableArray alloc] init];
        for (int n = 0; n < size; n++){
            if (m == n){
                innerMatrixData[n] = @1;
            }else{
                innerMatrixData[n] = @0;
            }
        }
        globalMatrixData[m] = innerMatrixData;
    }
    
    PVAlgebraMatrix *matrix = [[PVAlgebraMatrix alloc] initWithPredefinedMatrixArray:globalMatrixData rows:size columns:size];
    
    return matrix;
}

+ (PVAlgebraMatrix *)nullMatrixWithRows:(NSInteger)rows columns:(NSInteger)columns {
    PVAlgebraMatrix *matrix = [[PVAlgebraMatrix alloc] initWithRows:rows columns:columns setDefaultValueForAllElements:0];
    return matrix;
}


- (id)init {
    if (self = [super init]) {
        _matrixData = [[NSMutableArray alloc] init];
        _matrixRows = 0;
        _matrixColumns = 0;
    }
    
    return self;
}

- (id)initWithMatrix:(PVAlgebraMatrix *)matrix {
    if (self = [super init]) {
        _matrixData = [self createEntirelyNewArrayUsingArrayRepresentationFromMatrix:matrix];
        
        for (int m = 0; m < matrix.numberOfRows; m++){
            NSMutableArray *innerMatrixData = [[NSMutableArray alloc] init];
            for (int n = 0; n < matrix.numberOfColumns; n++){
                innerMatrixData[n] = [matrix elementAtRow:m+1 column:n+1];
            }
            _matrixData[m] = innerMatrixData;
        }
        
        _matrixRows = matrix.numberOfRows;
        _matrixColumns = matrix.numberOfColumns;   
    }
    
    return self;
}

- (id)initWithRows:(NSInteger)rows columns:(NSInteger)columns setDefaultValueForAllElements:(NSInteger)value {
    if (self = [super init]) {
        _matrixData = [[NSMutableArray alloc] init];
        
        if (rows <= 0){
            rows = 1;
        }
        if (columns <= 0){
            columns = 1;
        }
        
        _matrixRows = rows;
        _matrixColumns = columns;
        
        for (int m = 0; m < rows; m++){
            NSMutableArray *innerMatrixData = [[NSMutableArray alloc] init];
            for (int n = 0; n < columns; n++){
                innerMatrixData[n] = [NSNumber numberWithInteger:value];
            }
            _matrixData[m] = innerMatrixData;
        }
    }
    
    return self;
}



#pragma mark -
#pragma mark PVAlgebraMatrix Access Methods
- (NSMutableArray *)arrayRepresentation {
    return [self createEntirelyNewArrayUsingArrayRepresentationFromMatrix:self];
}

- (NSString *)stringRepresentation {
    NSMutableString *stringRepresentation = [[NSMutableString alloc] initWithString:@"["];
    
    for (int m = 0; m < _matrixRows; m++) {
        
        [stringRepresentation appendString:@"("];
        
        for (int n = 0; n < _matrixColumns; n++){
            [stringRepresentation appendString:[NSString stringWithFormat:@"%@", [self elementAtRow:m+1 column:n+1]]];
            
            if (n < _matrixColumns-1){
                [stringRepresentation appendString:@","];
            }
        }
        
        [stringRepresentation appendString:@")"];
        if (m < _matrixRows-1){
            [stringRepresentation appendString:@","];
        }
    }
    
    [stringRepresentation appendString:@"]"];
    
    return stringRepresentation;
}

- (NSInteger)numberOfRows {
    return _matrixRows;
}

- (NSInteger)numberOfColumns {
    return _matrixColumns;
}

- (NSInteger)minimumValueFromRowsAndColumns {
    if (_matrixRows == _matrixColumns){
        return _matrixRows;
    }else if(_matrixRows < _matrixColumns){
        return _matrixRows;
    }else{
        return _matrixColumns;
    }
}

- (id)elementAtRow:(NSInteger)row column:(NSInteger)column {
    if (row >= 1 && row <= _matrixRows && column >= 1 && column <= _matrixColumns){
        return _matrixData[row-1][column-1];
    }else{
        return nil;
    }
}

- (NSArray *)elementsFromRow:(NSInteger)row {
    if (row >= 1 && row <= _matrixRows){
        
        NSMutableArray *rowElements = [[NSMutableArray alloc] initWithCapacity:_matrixColumns];
        for (int n = 0; n < _matrixColumns; n++){
            rowElements[n] = [self elementAtRow:row column:n+1];
        }
        
        return rowElements;
        
    }else{
        return nil;
    }
}

- (NSArray *)elementsFromColumn:(NSInteger)column {
    if (column >= 1 && column <= _matrixColumns){
        
        NSMutableArray *columnElements = [[NSMutableArray alloc] initWithCapacity:_matrixRows];
        for (int m = 0; m < _matrixRows; m++){
            columnElements[m] = [self elementAtRow:m+1 column:column];
        }
        
        return columnElements;
        
    }else{
        return nil;
    }
}

- (NSArray *)mainDiagonalElements {
    NSMutableArray *diagonalElements = [[NSMutableArray alloc] initWithCapacity:self.minimumValueFromRowsAndColumns];
    
    for (int d = 0; d < self.minimumValueFromRowsAndColumns; d++){
        diagonalElements[d] = [self elementAtRow:d+1 column:d+1];
    }
    
    return diagonalElements;
}



#pragma mark -
#pragma mark PVAlgebraMatrix Action Methods
- (void)setMatrix:(PVAlgebraMatrix *)matrix {
    _matrixData = [self createEntirelyNewArrayUsingArrayRepresentationFromMatrix:matrix];
    _matrixRows = matrix.numberOfRows;
    _matrixColumns = matrix.numberOfColumns;
}

- (void)addRowFromArray:(NSArray *)rowArray {
    if (_matrixColumns == 0){
        _matrixColumns = [rowArray count];
    }
    
    NSMutableArray *newRowArray = [[NSMutableArray alloc] init];
    for (int n = 0; n < _matrixColumns; n++){
        if (n >= [rowArray count]){
            newRowArray[n] = @0;
        }else{
            newRowArray[n] = rowArray[n];
        }
    }
    
    _matrixData[_matrixRows] = newRowArray;
    _matrixRows++;
}

- (void)addColumnFromArray:(NSArray *)columnArray {
    if (_matrixRows == 0){
        _matrixRows = [columnArray count];
    }
    
    for (int n = 0; n < _matrixRows; n++){
        if (n >= [columnArray count]){
            _matrixData[n][_matrixColumns] = @0;
        }else{
            _matrixData[n][_matrixColumns] = columnArray[n];
        }
    }
    
    _matrixColumns++;
}

- (void)insertNewRow:(NSArray *)newRow atRow:(NSInteger)rowNumber {
    if (rowNumber >= 1 && rowNumber <= _matrixRows){
        
        for (NSInteger m = _matrixRows; m >= rowNumber-1; m--){
            if (m == rowNumber-1){
                
                NSMutableArray *tempNewRow = [[NSMutableArray alloc] init];
                for (int n = 0; n < _matrixColumns; n++){
                    if (n >= [newRow count]){
                        tempNewRow[n] = @0;
                    }else{
                        tempNewRow[n] = newRow[n];
                    }
                }
                _matrixData[m] = tempNewRow;
                
            }else{
                _matrixData[m] = [self elementsFromRow:m];
            }
        }
        
    }
    
    _matrixRows++;
}

- (void)insertNewColumn:(NSArray *)newColumn atColumn:(NSInteger)columnNumber {
    if (columnNumber >= 1 && columnNumber <= _matrixColumns){
        
        for (int m = 0; m < _matrixRows; m++){
            
            for (NSInteger n = _matrixColumns; n >= columnNumber-1; n--){
                if (n == columnNumber-1){
                    if (m >= [newColumn count]){
                        _matrixData[m][n] = @0;
                    }else{
                        _matrixData[m][n] = newColumn[m];
                    }
                    
                }else{
                    _matrixData[m][n] = _matrixData[m][n-1];
                }
            }
            
        }
        
    }
    
    _matrixColumns++;
}

- (void)removeRow:(NSInteger)rowNumber {
    [_matrixData removeObjectAtIndex:rowNumber-1];
    _matrixRows--;
}

- (void)removeColumn:(NSInteger)columnNumber {
    for (int m = 0; m < _matrixRows; m++){
        [_matrixData[m] removeObjectAtIndex:columnNumber-1];
    }
    _matrixColumns--;
}

- (void)replaceElementAtRow:(NSInteger)row column:(NSInteger)column withElement:(id)element {
    if (row >= 1 && row <= _matrixRows && column >= 1 && column <= _matrixColumns){
        _matrixData[row-1][column-1] = element;
    }
}

- (PVAlgebraMatrix *)addMatrix:(PVAlgebraMatrix *)matrix {
    if ([self canPerformMatrixAdditionWithMatrix:matrix]){
        PVAlgebraMatrix *newMatrix = [[PVAlgebraMatrix alloc] initWithMatrix:self];
        
        for (int m = 0; m < newMatrix.numberOfRows; m++){
            for (int n = 0; n < newMatrix.numberOfColumns; n++){
                [newMatrix replaceElementAtRow:m+1 column:n+1 withElement:@([[matrix elementAtRow:m+1 column:n+1] integerValue] + [[newMatrix elementAtRow:m+1 column:n+1] integerValue])];
            }
        }
        
        return newMatrix;
        
    }else{
        return nil;
    }
}

- (PVAlgebraMatrix *)subtractMatrix:(PVAlgebraMatrix *)matrix {
    if ([self canPerformMatrixSubtractionWithMatrix:matrix]){
        PVAlgebraMatrix *newMatrix = [[PVAlgebraMatrix alloc] initWithMatrix:self];
        
        for (int m = 0; m < newMatrix.numberOfRows; m++){
            for (int n = 0; n < newMatrix.numberOfColumns; n++){
                [newMatrix replaceElementAtRow:m+1 column:n+1 withElement:@([[matrix elementAtRow:m+1 column:n+1] integerValue] - [[newMatrix elementAtRow:m+1 column:n+1] integerValue])];
            }
        }
        
        return newMatrix;
        
    }else{
        return nil;
    }
}

- (PVAlgebraMatrix *)multiplyByScalar:(NSInteger)scalar {
    if (scalar != 0){
        PVAlgebraMatrix *newMatrix = [[PVAlgebraMatrix alloc] initWithMatrix:self];
        
        for (int m = 0; m < newMatrix.numberOfRows; m++){
            for (int n = 0; n < newMatrix.numberOfColumns; n++){
                [newMatrix replaceElementAtRow:m+1 column:n+1 withElement:@(scalar * [[newMatrix elementAtRow:m+1 column:n+1] integerValue])];
            }
        }
        
        return newMatrix;
        
    }else{
        return nil;
    }
}

- (PVAlgebraMatrix *)multiplyByMatrix:(PVAlgebraMatrix *)matrix {
    if ([self canPerformMatrixMultiplicationWithMatrix:matrix]){
        PVAlgebraMatrix *newMatrix;
        
        if (self.isNullMatrix || matrix.isNullMatrix){
            return [PVAlgebraMatrix nullMatrixWithRows:_matrixRows columns:matrix.numberOfColumns];
            
        }else if (self.isIdentityMatrix){
            newMatrix = [[PVAlgebraMatrix alloc] initWithMatrix:matrix];
            return matrix;
            
        }else if (matrix.isIdentityMatrix){
            newMatrix = [[PVAlgebraMatrix alloc] initWithMatrix:self];
            return newMatrix;
            
        }else{
            newMatrix = [[PVAlgebraMatrix alloc] init];
            
            for (int m = 0; m < _matrixRows; m++){
                NSMutableArray *newRowElements = [[NSMutableArray alloc] init];
                
                for (int n = 0; n < _matrixColumns; n++){
                    if (n < matrix.numberOfColumns){
                        
                        NSInteger elementValue = 0;
                        
                        for (int x = 0; x < matrix.numberOfRows; x++){
                            elementValue += [[self elementAtRow:m+1 column:x+1] integerValue] * [[matrix elementAtRow:x+1 column:n+1] integerValue];
                        }
                        
                        newRowElements[n] = [NSNumber numberWithInteger:elementValue];
                    }
                    
                }
                
                [newMatrix addRowFromArray:newRowElements];
            }
            
            return newMatrix;
        }
    }
    
    return nil;
}

- (PVAlgebraMatrix *)transpose {
    PVAlgebraMatrix *transposedMatrix = [[PVAlgebraMatrix alloc] init];
    
    if (self.isNullMatrix || self.isIdentityMatrix){
        transposedMatrix = [[PVAlgebraMatrix alloc] initWithMatrix:self];
        
    }else if(!self.isEmptyMatrix){
        for (int n = 0; n < _matrixColumns; n++){
            [transposedMatrix addRowFromArray:[self elementsFromColumn:n+1]];
        }
    }
    
    return transposedMatrix;
}



#pragma mark -
#pragma mark PVAlgebraMatrix Verification Methods
- (BOOL)isEqualToMatrix:(PVAlgebraMatrix *)matrix {
    BOOL matricesAreEqual = YES;
    
    if (_matrixRows == matrix.numberOfRows && _matrixColumns == matrix.numberOfColumns){
        BOOL needsToBreakLoop = NO;
        
        for (int i=0; i<_matrixRows; i++){
            for (int x=0; x<_matrixColumns; x++){
                if (![[self elementAtRow:i+1 column:x+1] isEqual:[matrix elementAtRow:i+1 column:x+1]]){
                    needsToBreakLoop = YES;
                    break;
                }
            }
            
            if (needsToBreakLoop){
                matricesAreEqual = NO;
                break;
            }
        }
        
    }else{
        matricesAreEqual = NO;
    }
    
    return matricesAreEqual;
}

- (BOOL)isRowVector {
    return (_matrixRows == 1);
}

- (BOOL)isColumnVector {
    return (_matrixColumns == 1);
}

- (BOOL)isSquareMatrix {
    return (_matrixRows == _matrixColumns);
}

- (BOOL)isNullMatrix {
    BOOL isReallyANullMatrix = YES;
    BOOL needsToBreakLoop = NO;
    
    for (int m = 0; m < _matrixRows; m++){
        for (int n = 0; n < _matrixColumns; n++){
            if (![[self elementAtRow:m+1 column:n+1] isEqual:@0]){
                needsToBreakLoop = YES;
                break;
            }
        }
        
        if (needsToBreakLoop){
            isReallyANullMatrix = NO;
            break;
        }
    }
    
    return isReallyANullMatrix;
}

- (BOOL)isEmptyMatrix {
    return (_matrixColumns == 0 && _matrixRows == 0);
}

- (BOOL)isIdentityMatrix {
    BOOL isReallyAnIdentityMatrix = YES;
    BOOL needsToBreakLoop = NO;
    
    for (int i=0; i<_matrixRows; i++){
        for (int x=0; x<_matrixColumns; x++){
            if (i == x){
                if (![[self elementAtRow:i+1 column:x+1] isEqual:@1]){
                    needsToBreakLoop = YES;
                    break;
                }
            }else{
                if (![[self elementAtRow:i+1 column:x+1] isEqual:@0]){
                    needsToBreakLoop = YES;
                    break;
                }
            }
        }
        
        if (needsToBreakLoop){
            isReallyAnIdentityMatrix = NO;
            break;
        }
    }
    
    return isReallyAnIdentityMatrix;
}

- (BOOL)isDiagonalMatrix {
    BOOL isReallyADiagionalMatrix = YES;
    BOOL needsToBreakLoop = NO;
    
    for (int m = 0; m < _matrixRows; m++){
        for (int n = 0; n < _matrixColumns; n++){
            if (m == n){
                if ([[self elementAtRow:m+1 column:n+1] isEqual:@0]){
                    needsToBreakLoop = YES;
                    break;
                }
            }else{
                if (![[self elementAtRow:m+1 column:n+1] isEqual:@0]){
                    needsToBreakLoop = YES;
                    break;
                }
            }
        }
        
        if (needsToBreakLoop){
            isReallyADiagionalMatrix = NO;
            break;
        }
    }
    
    return isReallyADiagionalMatrix;
}

- (BOOL)isUpperTriangularMatrix {
    BOOL isReallyAnUpperTriangularMatrix = YES;
    BOOL needsToBreakLoop = NO;
    
    for (int m = 0; m < _matrixRows; m++){
        for (int n = 0; n < _matrixColumns; n++){
            if (m < n){
                if (![[self elementAtRow:m+1 column:n+1] isEqual:@0]){
                    needsToBreakLoop = YES;
                    break;
                }
            }
        }
        
        if (needsToBreakLoop){
            isReallyAnUpperTriangularMatrix = NO;
            break;
        }
    }
    
    return isReallyAnUpperTriangularMatrix;
}

- (BOOL)isLowerTriangularMatrix {
    BOOL isReallyALowerTriangularMatrix = YES;
    BOOL needsToBreakLoop = NO;
    
    for (int m = 0; m < _matrixRows; m++){
        for (int n = 0; n < _matrixColumns; n++){
            if (m > n){
                if (![[self elementAtRow:m+1 column:n+1] isEqual:@0]){
                    needsToBreakLoop = YES;
                    break;
                }
            }
        }
        
        if (needsToBreakLoop){
            isReallyALowerTriangularMatrix = NO;
            break;
        }
    }
    
    return isReallyALowerTriangularMatrix;
}

- (BOOL)isTriangularMatrix {
    return (self.isUpperTriangularMatrix || self.isLowerTriangularMatrix);
}

- (BOOL)isBothUpperAndLowerTriangularMatrix {
    return (self.isUpperTriangularMatrix && self.isLowerTriangularMatrix);
}

- (BOOL)canPerformMatrixAdditionWithMatrix:(PVAlgebraMatrix *)matrix {
    return (_matrixRows == matrix.numberOfRows && _matrixColumns == matrix.numberOfColumns);
}

- (BOOL)canPerformMatrixSubtractionWithMatrix:(PVAlgebraMatrix *)matrix {
    return [self canPerformMatrixAdditionWithMatrix:matrix];
}

- (BOOL)canPerformMatrixMultiplicationWithMatrix:(PVAlgebraMatrix *)matrix {
    return (_matrixColumns == matrix.numberOfRows);
}


#pragma mark -
#pragma mark PVAlgebraMatrix Custom Description
//this needs more work, right now it's just a very simple way to visualize the PVAlgebraMatrix data between | . . . . |
- (NSString *)description {
    NSMutableString *visualMatrixString = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%li x %li Matrix:\n", _matrixRows, _matrixColumns]];
    
    for (int m = 0; m < _matrixRows; m++) {
        [visualMatrixString appendString:@"| "];
        for (int n = 0; n < _matrixColumns; n++){
            if (n > 0){
                [visualMatrixString appendString:@" "];
            }
            [visualMatrixString appendString:[NSString stringWithFormat:@"%@", [self elementAtRow:m+1 column:n+1]]];
        }
        [visualMatrixString appendString:@" |\n"];
    }
    
    return [NSString stringWithFormat:@"%@", visualMatrixString];
}

@end