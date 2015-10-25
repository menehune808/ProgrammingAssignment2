##
## Title:  cachematrix.R
##
## Author: gilbert maerina
##
## Date:   20151023
##
## Purpose:
##     makeCacheMatrix(matrix) : Function returns a vector of matrix  
##                         objects 
##
##     cacheSolve(matrix): Returns the inverse of the 
##                         matrix returned by makeCacheMatrix()
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
  setInverse <- function(solve){
    inv_result <<- solve 
  } # end setInverse()

  # get inverse matrix object
  getInverse <- function(){
    return(inv_result)
  } # end getInverse()

  # list of functions accesible through indexing device, '$'
  list( set = set, 
        get = get,
        setInverse = setInverse,
        getInverse = getInverse)

} # end makeCacheMatrix()


## Write a short comment describing this function
##
## Function computes the inverse of the special matrix returned
## by makeCacheMatrix
##
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  # get inverse
  inv_result <- x$getInverse()

  # check if already done
  if( !is.null(inv_result)){
    message("getting cached data")
    return(inv_result)
  }
  else {
    message("no cached data, processing")
  } # end if-else(!null) 

  # get a copy of the matrix
  data <- x$get()
 
  # process the inverse of the matrix
  # for this assignment we can assume that the matrices
  # are all invertible, however we will check to make sure 
  # that the matrix is a square
  if( nrow(data) == ncol(data) ){
    inv_result <- solve(data,...)
  } 
  else {
    stop("Cannot process non-square matrix")
  } # end if-else(row==col)
  
  # set the caching object with the inverse solution
  x$setInverse(inv_result)

  # return result
  inv_result

} # end cacheSolve()
