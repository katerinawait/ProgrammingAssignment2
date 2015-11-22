## Put comments here that give an overall description of what your
## functions do
## These funcrions calculate inverse of matrix that is invertible and store it in global memory for future use.
## if inverse is in the global repository then stored values ae recalled. There is no checking whether the result is correct
## Write a short comment describing this function

# this function stoes inverses and matrix in the global environment

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## this function call inverse matrix if it isn't alreagy in global environemt

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  print (x)
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
  
}