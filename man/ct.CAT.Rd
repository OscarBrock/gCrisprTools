% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generateCAT.R
\name{ct.CAT}
\alias{ct.CAT}
\title{Compare Two CRISPR Screens via a CAT plot}
\usage{
ct.CAT(
  dflist,
  targets = c("geneSymbol", "geneID"),
  switch.dir = FALSE,
  plot.it = TRUE
)
}
\arguments{
\item{dflist}{A list of results dataframes. Names will be preserved, and the enrichment calculation is conditioned on 
the first element of the list.}

\item{targets}{Column of the provided \code{summaryDF} to consider. Must be \code{geneID} or \code{geneSymbol}.}

\item{switch.dir}{Logical indicating whether to test overlap of signals in the same direction, or whether the 
directionality is expected to reverse. `same.dir = FALSE` looks at the consistency between depleted signals in `df1` and 
enriched signals in `df2`.}

\item{plot.it}{Logical indicating whether to compose the plots on the default device. Two CAT plots summarizing overlap in 
both enrichment directions are drawn.}
}
\value{
Invisibly, a data.frame containing the relevant summary stats for each target in both screens.
}
\description{
This is a function for comparing the results of two screening experiments. Given two \code{summaryDF}, 
the function places them in register with one another, generates a Concordance At The Top (CAT) plot, and returns an 
invisible dataframe containing the relevant gene-level signals. Signals are aggregated by P-value threshold, such 
that the concordance is represented as the portion of shared values meeting or exceeding that significance threshold.

This function is conceptually similar to the `ct.ROC` and `ct.PRC()` functions, but is appropriate when considering 
consistency of ranked values rather than an interchangeable set; the most common use case is for comparing primary 
and replication screens, where the underlying technology and selection criteria are expected to be highly similar. 
CAT plots are fundamentally about comparing rankings, and so only targets in common between the two provided 
screens are considered. If the totality of list overlap is important, consider using `ct.PRC()` or `ct.ROC()`.
}
\examples{
data('resultsDF')
cat <- ct.CAT(list('first' = resultsDF, 'second' = resultsDF[1:2000,]))
head(cat)
}
\author{
Russell Bainer
}
