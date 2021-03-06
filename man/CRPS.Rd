% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{CRPS}
\alias{CRPS}
\title{Compute continous rank probability score for normal distributions}
\usage{
CRPS(x, mu, sig)
}
\arguments{
\item{x}{a vector of true values (held-out data)}

\item{mu}{a vector of predictive means}

\item{sig}{a vector of predictive standard deviations}
}
\description{
This function compute the continous rank probability score for
normal distributions. It is mainly used to evaluate the validility of 
predictive distributions.
}
\author{
Pulong Ma <mpulong@gmail.com>
}
