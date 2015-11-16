## These functions are used to save of a matrix, compute its inverse,
## save the inverse, and fetch the saved inverse if the saved matrix 
## has not been modified.

## This function is used to save of a matrix, and associate the needed 
## functions to either set or get the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The first time cacheSolve() is called, it computes the 
## inverse of the matrix and saves it off.  As long as the
## matrix is not modified, it gets the stored inverse for 
## the matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  ## determine if inverse has been saved
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  ## compute the inverse
  ## with one argument, solve() assumes the second argument
  ## is the idenity matrix, thus computes the inverse of the
  ## matrix
  data <- s$get()
  m <- solve(data,...)
  ## saves off the inverse
  x$setinverse(m)
  m
}
