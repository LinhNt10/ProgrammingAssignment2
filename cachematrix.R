makeCacheMatrix <- function(m = matrix()){
  i <- NULL
  set <- function(matrix){
    m <- matrix
    i <- NULL
  }
  get <- function(){
    m
  }
  setInverse <- function(inverse){
    i <- inverse
  }
  getinverse <- function(){
    i
  }
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
  data <- x$get()
  m <- solve(data) %*% data
  s$setInverse(m)
  m
}