## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##
## Function creates a special matrix object that can cache its inverse
##
makeCacheMatrix <- function(x = matrix()) {

  # object that holds the inverse of the matrix
  inv_result <- NULL

  # internal function to set matrix
  set <- function(y) {
    x <<- y
    inv_result <<- NULL
  } # end set-function()

  # get value of matrix
  get <- function() {
    x
  } # end get-function() 

  # set inverse matrix result object
  setInverse <- function(inver){
    inv_result <<- inver
  } # end setInverse()

  # get inverse matrix object
  getInverse <- function(){
    inv_result
  } # end getInverse()

} # end makeCacheMatrix()


## Write a short comment describing this function
##
## Function computes the inverse of the special matrix returned
## by mackCacheMatrix
##
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

} # end cacheSolve()
