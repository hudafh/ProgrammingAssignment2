## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#create a cache matrix( called cacheMatrix) that will store the inverse of the original matrix. It will have the same nr of rows and cols as the original
#There will be a function to get the inverse( called getInv) and it shall return the matrix mentioned above

#The cacheSOlve function shall calculate the inverse of x and assign it to the cache matrix variable


makeCacheMatrix <- function(x = matrix()) {

  cacheMatrix <- matrix(nrow=nrow(x), ncol = ncol(x))

  get <- function() x
  getInv <- function() cacheMatrix
  
  setInv <- function(y) cacheMatrix <<- y
  
  list(get = get, getInv = getInv, setInv=setInv)
}


## Write a short comment describing this function
#matrix are atomic vectors. The matrix will have to be split, worked on, and then recomposed

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  cacheMatrix <- x$getInv()
  
  if(!is.null(cacheMatrix) && !is.na(cacheMatrix)) {
    message("getting cached inverse of the matrix")
    return(cacheMatrix)
  }
  message("Calculating the Inverse of the Matrix!")
  matrix <- x$get()
  message("The inverse of the Matrix is:")
  cacheMatrix <- solve(matrix)
  x$setInv(cacheMatrix)
  cacheMatrix
    
  
  
}