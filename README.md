PVAlgebraMatrix
===============
An Objective-C class that performs basic Linear Algebra Matrix (learn more <a target="_blank" href="http://en.wikipedia.org/wiki/Matrix_(mathematics)">here</a>) operations, such as:
* Addition
* Subtraction
* Multiplication
* Multiplication by a scalar
* Transposition


Why I did this?
----------------
I've been teaching myself Objective-C since I was 15 and recently I entered university to study Computer Science. Among all the available subjects, the one that I'm liking the most (besides programming) is Linear Algebra and Analytic Geometry so I decided to combine my Objective-C skills with what I'm learning in university and try to simulate an Algebra Matrix class.

Features
----------------
<b><u>General Features</u></b>:<br>
This class was designed to work somewhat like a `NSArray`, in terms of how you perform certain operations, so you can do stuff like:
* Retrieve the number of rows / columns of the matrix (like you would do with `NSArray`'s `count`)
* Add/Insert a new row/columm
* Remove a row/column
* Retrieve an entire row/column (in a `NSArray`)
* Retrieve an element from the matrix (at a specific row and column)
* Replace a especific element with a new one

<b>Specific Linear Algebra Matrix Features</b>:<br>
* Retrieve the main diagonal elements (in a `NSArray`)
* Check if the matrix is a Row / Column vector
* Check if the matrix is a Null / Empty / Square / Identity / Diagonal / Triangular matrix
* Check if two matrices are equal

How to use
----------------
1.  Add both .h and .m files of `PVAlgebraMatrix` into your project.
2.  Import `PVAlgebraMatrix.h` to wherever you want to use it just by `#import "PVAlgebraMatrix.h"`
3.  You're ready to start creating your own Matrices and kickass!

Creating Matrices
----------------
There are several ways of creating Matrices. You could just "alloc init" a `PVAlgebraMatrix` object to create an empty Matrix (0 rows and columns, with no elements) and add rows / columns as you wish, or you could create a default Matrix type (Identity or Null) in just one line of code.<br>
#### Identity Matrix:
``` objective-c
PVAlgebraMatrix *identityMatrix = [PVAlgebraMatrix identityMatrixWithSize:5];
```
#### Null Matrix:
``` objective-c
PVAlgebraMatrix *nullMatrix = [PVAlgebraMatrix nullMatrixWithRows:5 columns:5];
```
#### Matrix with a default value for all the elements:
``` objective-c
PVAlgebraMatrix *defaultValuesMatrix = [[PVAlgebraMatrix alloc] initWithRows:4 columns:5 setDefaultValueForAllElements:5];
```
#### Custom Matrix:
``` objective-c
PVAlgebraMatrix *customMatrix = [[PVAlgebraMatrix alloc] init];
[customMatrix addRowFromArray:@[@2,@3,@4]];
[customMatrix addRowFromArray:@[@5,@6,@7]];
[customMatrix addRowFromArray:@[@8,@9,@0]];
[customMatrix addColumnFromArray:@[@1,@1,@1]];
```

Author
----------------
PVAlgebraMatrix was created by Pedro Vieira.<br>
<a target="_blank" href="https://twitter.com/w1tch_">@w1tch_</a><br>
<a href="mailto:pedrovieiradev@hotmail.com?Subject=PVAsyncImageView">pedrovieiradev@hotmail.com</a>

License
----------------
Check "LICENSE" to know more.
