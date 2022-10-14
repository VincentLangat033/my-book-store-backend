# README

## MY_BOOK_STORE PROJECT

## Description
This is a Book store project in which the user is able to perform the following operations.
- A user can register and Log in to the system
- A user can search for their favorite books
- A user can add that book to their Library
- Through a GotoMy Books link, the user is able to access saved books
- The User can then rate that book, update or delete that rating
- A user can indicate whether they have read or whether they own that book.
-And finally a user can remove that book from their library.


## Access to the Front End
_Front here part -[here](https://github.com/VincentLangat033/my-book-store-frontend)
 - Feel free to contribute!



<h1> Setup/Installation Requirements </h1>
<ol>
<li>Clone the project using git -clone https://github.com/VincentLangat033/my-book-store-backend  If you are not able to clone it, you can download the files as a zip folder</li>


 <li> Ensure that you have access to the complete file</li>

</ol>
<h1> Technologies Used</h1>

### Ruby

## Project Guidelines
This  project should conform to the following set of guidelines:

## Models
### It creates the following relationships:

- A `Book` has many `bookselves`s through `user_bookshelves`, source `user`
- A `Book` has many `ratings`s through `user_ratings`, source `user`

- A `User` has many `rated_books` through `ratings`, source `book`


- A `Comment` belongs to a `User` and belongs to a `book`

