# Package/Function Loading
source("reductDims.R")

# Test reductDims
input <- matrix(runif(50*100), nrow=50, ncol=100)
out <- reductDims(
    input=input,
    dim_pca=10,
    dim_tsne=2,
    type_pca="svd",
    verbose=TRUE)

expect_equal(length(out), 2)
expect_equal(length(out[[1]]), 3)
expect_equal(length(out[[2]]), 14)

expect_identical(names(out[[1]]),
    c("d", "u", "v"))
expect_identical(names(out[[2]]),
    c("N", "Y", "costs", "itercosts", "origD", "perplexity",
        "theta", "max_iter", "stop_lying_iter", "mom_switch_iter",
        "momentum", "final_momentum", "eta", "exaggeration_factor"))

# Test plotDims
out <- plotDims(out)
expect_true(is.null(out))
