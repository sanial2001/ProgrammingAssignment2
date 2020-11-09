## Put comments here that give an overall description of what your
## functions do

## first function is used for calculating matrix thriugh lexical scoping

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  
  list(set = set , get = get ,
       setinv = setinv ,
       getinv = getinv
       )

}


## this is used for caching the data


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)){
    print("caching data from cache")
    return(inv)
  }
  
  value <- x$get()
  inv <- solve(value,...)
  x$setinv(inv)
  inv
  
}
