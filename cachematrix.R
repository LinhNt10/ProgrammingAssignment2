# Creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(m = matrix()){
  # Initialize the inverse property
  i <- NULL
  ## Method to set the matrix
  set <- function(matrix){
    m <- matrix
    i <- NULL
  }
  # Method the get the matrix
  get <- function(){
    m
  }
  # Method to set the inverse of the matrix
  setInverse <- function(inverse){
    i <- inverse
  }
  # Method to get the inverse of the matrix
  getinverse <- function(){
    i
  }
  # Return a list of the methods
  list(set = set, get = get, 
       setInverse = setInverse,
       getinverse = getinverse)
}

cacheSolve <- function(x,...){
  m <- x$getinverse()
  if (!is.null(m)){
    message("getting cached data")
    return(m)
  }
  # Get the matrix from our object
  data <- x$get()
  # Calculate the inverse using matrix multiplication
  m <- solve(data) %*% data
  # Set the inverse to the object
  s$setInverse(m)
  # Return the matrix
  m
}
