## Put comments here that give an overall description of what your
## functions do
## The two functions below are used to create a special object that stores a numeric vector and caches its mean

## Write a short comment describing this function
## makeCacheMatrix function will create a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
      cacheMatrix <- NULL
      
      set <- function(y) {
            x <<- y
            cacheMatrix <<- NULL
      }
      get <- function() x
      setmean <- function(mean) cacheMatrix <<- mean
      getmean <- function() cacheMatrix
      list(set = set, get = get,
           setmean = setmean,
           getmean = getmean)
}



## Write a short comment describing this function
## cacheSolve function computes the inverse of the special matrix returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve function retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      cacheMatrix <- x$getmean()
      if(!is.null(cacheMatrix)) {
            message("getting cached data")
            return(cacheMatrix)
      }
      data <- x$get()
      cacheMatrix <- mean(data, ...)
      x$setmean(cacheMatrix)
      cacheMatrix
}
