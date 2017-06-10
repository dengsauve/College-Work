# Word Search
*Upload 4 files:  puzzle_main.rb, puzzle.rb, puzzle.pdf, words.txt*
## Objectives
1. Write a program that will read a list of words from a disk data file called “words.txt”.
    * This file should contain one word per line.

2. Create a class for this structure called "Puzzle" and utilize methods and variables appropriately in this class.

**NO PRINTING DIRECTLY FROM THE CLASS** – the class methods should only return strings which the main program will utilize/print, etc.

3. This list of words will then need to be put into a grid (double array) whose size is **45 x 45** where each word is randomly
inserted into the array in one of the following directions:
* Horizontal
* Vertical
* Diagonal-right
* Diagonal-left
*and their corresponding backwards equivalents.*  There would be a total of **8 possible directions for a word.**

4. Once all the words are inserted into the array, then your program should fill in all the blank cells with random letters.

**Use ONLY letters that are contained in the Words from the word list.**

5. Once your array is filled, print out the resulting puzzle along with the answer key,
which would be the array without the random letters.
    * The puzzle output must be created in a PDF file that contains 2 pages.
        1. **First page** is the *puzzle with the words to find under the puzzle*.
        2. The **second page** (of the same document) is the *KEY*.
    * See example PDF.

## Algorithm

1. Read the list of words and then **sort them by the length of each word from *largest to smallest***.
    * This makes it easier to fit in the larger words first.  You can use something like this to sort an array called “a”: 
    * a.sort_by{ |x| x.length }
2. Select a random row/col to start your placement of the word. 
3. Choose a random “direction” to begin placement.
4. Start test-placing letters into the cells in the correct direction.
    * You can only test-place a letter if the current cell is either empty or contains the correct letter in the correct position.
    * If you cannot continue for any reason, then mark the starting cell as “used” and start over with a new random direction.
    * Don’t reuse a direction for the same word.

5. Once you can successfully place a word, place the word permanently and move on to the next word.

6. You can keep track of which random row/col that you have already “checked” for a word by using a parallel
double array (45x45) to store if the cell is “used” or not.
7. Create a method for getting a new start position.
8. Be sure to reset this checking array for each word.