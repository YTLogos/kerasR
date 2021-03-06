library(kerasR)

context("Testing initalizers")

check_keras_available <- function() {
  if (!keras_available(silent = TRUE)) {
    skip("Keras is not available on this system.")
  }
}

test_that("initalizers", {
  skip_on_cran()
  check_keras_available()

  X_train <- matrix(rnorm(100 * 10), nrow = 100)
  Y_train <- to_categorical(matrix(sample(0:2, 100, TRUE), ncol = 1), 3)

  mod <- Sequential()
  mod$add(Dense(units = 50, input_shape = dim(X_train)[2]))
  mod$add(Activation("relu"))
  mod$add(Dense(units = 3, kernel_initializer = Zeros(),
                bias_initializer = Ones()))
  mod$add(Dense(units = 3, kernel_initializer = Constant(),
                bias_initializer = RandomNormal()))
  mod$add(Dense(units = 3, kernel_initializer = RandomUniform(),
                bias_initializer = TruncatedNormal()))
  mod$add(Dense(units = 3, kernel_initializer = Orthogonal(),
                bias_initializer = VarianceScaling()))
  mod$add(Dense(units = 3, kernel_initializer = Identity(),
                bias_initializer = lecun_uniform()))
  mod$add(Dense(units = 3, kernel_initializer = glorot_normal(),
                bias_initializer = glorot_uniform()))
  mod$add(Dense(units = 3, kernel_initializer = he_normal(),
                bias_initializer = he_uniform()))
  mod$add(Activation("softmax"))
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = RMSprop())

  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5, verbose = 0)
  testthat::expect_false(mod$stateful)

})
