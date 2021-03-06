##The first function, makeCachematrix creates a special "matrix", which is really a list containing a function to
## 1. set the value of matrix 2. Get the value of matrix 3. Set the value for inverse of matrix 4. Get the value for inverse
## of matrix.
## 

makeCacheMatrix <- function(x = matrix()) {
inv<-NULL
        set<-function(y) {
                x<<-y
                inv<<-NULL
        }
        get<-function() x
        setinverse<-function(inverse) inv<<-inverse
        getinverse<-function() inv
        list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
        

}


## The following function calculates the inverse of the special "matrix" created with the above function.
##However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. 
##Otherwise, it calculates the inverse of the data and sets its value

cacheSolve <- function(x, ...) {
        inv<-x$getinverse()
        if(!is.null(inv)){
                message("getting catched inverse")
                return(inv)
        }
        
        data<-x$get()
        inv<-solve(data,...)
        x$setinverse(inv)
        inv
        
}
