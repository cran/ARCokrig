% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cokm.condsim.R
\name{cokm.condsim}
\alias{cokm.condsim}
\title{Conditional simulation at new inputs in the autoregressive cokriging model}
\usage{
cokm.condsim(obj, input.new, nsample = 30)
}
\arguments{
\item{obj}{a \code{\link{cokm}} object construted via the function \code{\link{cokm}} in 
this package}

\item{input.new}{a matrix including new inputs for making prediction}

\item{nsample}{a numerical value indicating the number of samples}
}
\description{
This function simulate from predictive distributions in
 autogressive cokriging models
}
\examples{
Funcc = function(x){
  return(0.5*(6*x-2)^2*sin(12*x-4)+10*(x-0.5)-5)
}

Funcf = function(x){
  z1 = Funcc(x)
  z2 = 2*z1-20*x+20 + sin(10*cos(5*x))
  return(z2)
}

#####################################################################
###### Nested design 
#####################################################################
Dc <- seq(-1,1,0.1)
indDf <- c(1, 3, 6, 8, 10, 13, 17, 21)
zc <- Funcc(Dc)
Df <- Dc[indDf]
zf <- Funcf(Df)

input.new = as.matrix(seq(-1,1,length.out=200))


## create the cokm object
prior = list(name="Reference")
obj = cokm(formula=list(~1,~1+x1), output=list(c(zc), c(zf)),
              input=list(as.matrix(Dc), as.matrix(Df)),
              prior=prior, cov.model="matern_5_2")

## update model parameters in the cokm object

obj = cokm.fit(obj)


cokrige = cokm.condsim(obj, input.new, nsample=30)


}
\seealso{
\code{\link{cokm}}, \code{\link{cokm.fit}}, \code{\link{cokm.predict}}, \code{\link{ARCokrig}}
}
\author{
Pulong Ma <mpulong@gmail.com>
}
