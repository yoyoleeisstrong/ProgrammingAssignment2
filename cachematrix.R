# This function could cache the reversible matrix, and return a list of functions
makeCacheMatrix <- function(x = numeric()) {
# initial 'i'
# 'i' would cache the reversible matrix
        i <- NULL

# get the 'x' value
        get <- function() x
# set the inversible matrix
        setInverse <- function(inverse) i <<- inverse
# get the cached inversible matrix
        getInverse <- function() i
# return a list of functions
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}
# This function could calculate reversible matrix while the reversible matrix is
# not exist
cacheSolve <- function(x, ...) {
# get the inversible value from x which is the list of functions
        m <- x$getInverse()
# if inversible value was exist, then return it
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
# if inversible value was not exist, then calculate it
# first, get the matrix defined by 'x'
        data <- x$get()
# second, calculate the inversible matrix defined by'x'
        i <- solve(data, ...)
# third, cache the inversible value defined by 'x'
        x$setInverse(i)
        m
}
